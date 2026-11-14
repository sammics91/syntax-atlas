"use client";

import { useEffect, useRef, useState } from "react";
import Link from "next/link";
import dynamic from "next/dynamic";

import { useAuth } from "@/components/AuthProvider";

import styles from "./page.module.css";

// 只在展開語法說明時載入唯讀範例。
const CodeExample = dynamic(() => import("@/components/CodeExample"), {
  ssr: false,
  loading: () => <p role="status">正在載入範例…</p>,
});

type StatisticsLanguage = "python" | "html" | "css";

const STATISTICS_LANGUAGES: {
  value: StatisticsLanguage;
  label: string;
}[] = [
  { value: "python", label: "Python" },
  { value: "html", label: "HTML" },
  { value: "css", label: "CSS" },
];

type SyntaxUsage = {
  id: number;
  name: string;
  display_label: string | null;
  summary: string;
  example_code: string;
  count: number;
  language: StatisticsLanguage;
};

type StatisticsResult = {
  language: string;
  record_count: number;
  usages: SyntaxUsage[];
};

export default function StatisticsPage() {
  // 目前會員
  const { user } = useAuth();
  const userId = user?.id;
  // 會員的語法統計資料
  const [statistics, setStatistics] = useState<StatisticsResult | null>(null);
  // 目前選取的語言頁籤
  const [selectedLanguage, setSelectedLanguage] =
    useState<StatisticsLanguage | null>(null);
  // 一次只展開一筆語法說明。
  const [expandedSyntaxId, setExpandedSyntaxId] = useState<number | null>(null);
  // 資料載入與錯誤提示
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState("");
  // 收藏資料與會員綁定，避免切換帳號時混用。
  const [memberBookmarks, setMemberBookmarks] = useState<{
    userId: number;
    ids: number[];
    error: boolean;
  } | null>(null);

  const [isBookmarkSaving, setIsBookmarkSaving] = useState(false);
  const [bookmarkNotice, setBookmarkNotice] = useState("");
  const bookmarkSavingRef = useRef(false);
  const languageOverviewRef = useRef<HTMLDivElement>(null);

  // 用原占比寬度判斷是否改用左右切換，避免切換模式後反覆跳動。
  useEffect(() => {
    const overview = languageOverviewRef.current;
    if (!overview) return;
    const canvas = document.createElement("canvas");
    const context = canvas.getContext("2d");
    if (!context) return;
    let active = true;
    function fitTabs() {
      if (!active || !overview || !context) return;
      const tabs = Array.from(
        overview.querySelectorAll<HTMLButtonElement>("button[data-count]"),
      );
      const total = tabs.reduce(
        (sum, tab) => sum + Number(tab.dataset.count),
        0,
      );
      const width = overview.clientWidth;
      if (!total || !width) return;
      const tabsOverflow = (twoLines: boolean) => {
        overview.dataset.stacked = String(twoLines);
        return tabs.some((tab) => {
          const label = tab.firstElementChild as HTMLElement;
          const style = getComputedStyle(label);
          // 預留加粗選取狀態，切換語言時不因字寬改變而跳動。
          context.font = `700 ${style.fontSize} ${style.fontFamily}`;
          const parts = Array.from(label.children).map(
            (part) => part.textContent ?? "",
          );
          const textWidth = twoLines
            ? Math.max(...parts.map((part) => context.measureText(part).width))
            : context.measureText(parts.join(" ")).width;
          const needed =
            textWidth +
            parseFloat(style.paddingLeft) +
            parseFloat(style.paddingRight) +
            8;
          return needed > (width * Number(tab.dataset.count)) / total;
        });
      };
      // 依實際文字寬度依序嘗試單行、兩行，最後才改用左右切換。
      const needsCompactTabs = tabsOverflow(false) && tabsOverflow(true);
      overview.dataset.compact = String(needsCompactTabs);
      // 小色塊保留真實寬度；百分比先縮至最低 10px，仍放不下才隱藏。
      for (const segment of overview.querySelectorAll<HTMLButtonElement>(
        "button[data-share]",
      )) {
        const label = segment.firstElementChild as HTMLElement;
        label.style.removeProperty("font-size");
        const style = getComputedStyle(label);
        const baseSize = parseFloat(style.fontSize);
        context.font = `700 ${style.fontSize} ${style.fontFamily}`;
        const textWidth = context.measureText(label.textContent ?? "").width;
        const availableWidth = Math.max(0, segment.clientWidth - 8);
        const fontSize = Math.max(
          10,
          Math.min(baseSize, (baseSize * availableWidth) / (textWidth || 1)),
        );
        label.style.fontSize = `${fontSize}px`;
        label.dataset.visible = String(
          (textWidth * fontSize) / baseSize <= availableWidth,
        );
      }
    }
    const observer = new ResizeObserver(fitTabs);
    observer.observe(overview);
    window.addEventListener("resize", fitTabs);
    void document.fonts.ready.then(fitTabs);
    fitTabs();
    return () => {
      active = false;
      observer.disconnect();
      window.removeEventListener("resize", fitTabs);
    };
  }, [statistics, isLoading, error]);

  const currentBookmarks =
    memberBookmarks?.userId === userId ? memberBookmarks : null;

  // 取得目前會員累積的語法使用次數
  useEffect(() => {
    if (userId === undefined) return;

    const controller = new AbortController();

    async function loadStatistics() {
      setIsLoading(true);
      setError("");

      try {
        const response = await fetch("/api/statistics?language=all", {
          credentials: "include",
          cache: "no-store",
          signal: controller.signal,
        });

        if (!response.ok) {
          throw new Error(
            response.status === 401
              ? "登入已失效，請重新整理並登入。"
              : "無法取得常用語法統計，請稍後再試。",
          );
        }

        const data = await response.json();

        if (
          !data ||
          typeof data.record_count !== "number" ||
          !Array.isArray(data.usages)
        ) {
          throw new Error("統計資料的回傳格式不正確。");
        }

        if (!controller.signal.aborted) {
          setStatistics(data);
        }
      } catch (error) {
        if (controller.signal.aborted) return;

        setError(
          error instanceof Error
            ? error.message
            : "無法取得常用語法統計，請稍後再試。",
        );
      } finally {
        if (!controller.signal.aborted) {
          setIsLoading(false);
        }
      }
    }

    void loadStatistics();

    return () => controller.abort();
  }, [userId]);

  // 進入頁面或切換會員時，取得收藏狀態。
  useEffect(() => {
    if (userId === undefined) return;

    const controller = new AbortController();
    const ownerId = userId;

    async function loadBookmarks() {
      try {
        const response = await fetch("/api/bookmarks", {
          credentials: "include",
          cache: "no-store",
          signal: controller.signal,
        });

        if (!response.ok) {
          throw new Error("無法取得收藏清單");
        }

        const data = await response.json();

        if (
          !Array.isArray(data.bookmarks) ||
          !data.bookmarks.every(
            (item: { syntax_id?: unknown } | null) =>
              item !== null && typeof item.syntax_id === "number",
          )
        ) {
          throw new Error("收藏清單格式異常");
        }

        if (!controller.signal.aborted) {
          setMemberBookmarks({
            userId: ownerId,
            ids: data.bookmarks.map(
              (item: { syntax_id: number }) => item.syntax_id,
            ),
            error: false,
          });
        }
      } catch {
        if (!controller.signal.aborted) {
          setMemberBookmarks({
            userId: ownerId,
            ids: [],
            error: true,
          });
        }
      }
    }

    void loadBookmarks();

    return () => controller.abort();
  }, [userId]);

  const allUsages = statistics?.usages ?? [];

  // 加總每個語言的出現次數，不是語法種類數。
  const languageTotals = STATISTICS_LANGUAGES.map((language) => ({
    ...language,
    count: allUsages
      .filter((syntax) => syntax.language === language.value)
      .reduce((total, syntax) => total + syntax.count, 0),
  }));

  const totalCount = languageTotals.reduce(
    (total, language) => total + language.count,
    0,
  );

  // 隱藏尚未使用的語言，依累積使用次數由多到少排列並計算占比。
  const languageTabs = languageTotals
    .filter((language) => language.count > 0)
    .sort((a, b) => b.count - a.count)
    .map((language) => ({
      ...language,
      percentage: (language.count / totalCount) * 100,
    }));

  // 未手動選取時，顯示使用次數最多的語言；也適用僅有 HTML 或 CSS 的會員。
  const activeLanguage = languageTabs.some(
    (language) => language.value === selectedLanguage,
  )
    ? selectedLanguage
    : (languageTabs[0]?.value ?? "python");

  const activeLanguageLabel =
    STATISTICS_LANGUAGES.find((language) => language.value === activeLanguage)
      ?.label ?? "Python";

  // 左右依占比排名循環切換，按鈕預告下一個會顯示的語言。
  const activeLanguageIndex = languageTabs.findIndex(
    (language) => language.value === activeLanguage,
  );
  const previousLanguage =
    languageTabs[
      (activeLanguageIndex - 1 + languageTabs.length) % languageTabs.length
    ];
  const nextLanguage =
    languageTabs[(activeLanguageIndex + 1) % languageTabs.length];

  // API 已按次數排序，篩選語言後保留原本順序。
  const usages = allUsages.filter(
    (syntax) => syntax.language === activeLanguage,
  );

  const maxCount = usages[0]?.count ?? 0;

  async function toggleBookmark(syntaxId: number) {
    if (
      userId === undefined ||
      !currentBookmarks ||
      currentBookmarks.error ||
      bookmarkSavingRef.current
    ) {
      return;
    }

    const ownerId = userId;
    const wasBookmarked = currentBookmarks.ids.includes(syntaxId);

    bookmarkSavingRef.current = true;
    setIsBookmarkSaving(true);
    setBookmarkNotice("");

    try {
      const response = await fetch(`/api/bookmarks/${syntaxId}`, {
        method: wasBookmarked ? "DELETE" : "PUT",
        credentials: "include",
      });

      if (!response.ok) {
        throw new Error(
          response.status === 401
            ? "登入已失效，請重新整理並登入。"
            : "無法更新收藏，請稍後再試。",
        );
      }

      // 後端成功後才更新圖示。
      setMemberBookmarks((previous) => {
        if (!previous || previous.userId !== ownerId) {
          return previous;
        }

        return {
          ...previous,
          ids: wasBookmarked
            ? previous.ids.filter((id) => id !== syntaxId)
            : [...new Set([...previous.ids, syntaxId])],
        };
      });
    } catch (error) {
      setBookmarkNotice(
        error instanceof Error ? error.message : "無法更新收藏，請稍後再試。",
      );
    } finally {
      bookmarkSavingRef.current = false;
      setIsBookmarkSaving(false);
    }
  }

  return (
    <>
      <h1 className="page-title">我的常用語法</h1>

      <p className="page-description">
        語法使用次數及占比，皆依已儲存程式碼中的語法出現次數計算。
      </p>

      {isLoading ? (
        <p className={styles.message} role="status">
          正在讀取常用語法統計…
        </p>
      ) : error ? (
        <p className={styles.error} role="alert">
          {error}
        </p>
      ) : statistics?.record_count === 0 ? (
        <section
          className={styles.empty}
          aria-labelledby="statistics-empty-title"
        >
          <div className={styles.icon} aria-hidden="true">
            {"{ }"}
          </div>

          <h2 id="statistics-empty-title">還沒有儲存的程式碼</h2>

          <p>從第一段程式碼開始，留下你的語法足跡。</p>

          <p>貼上程式碼、完成分析並儲存後，就能在這裡回顧與編輯。</p>

          <Link href="/" className={styles.startButton}>
            ＋ 開始分析程式碼
          </Link>
        </section>
      ) : (
        <section
          className={styles.section}
          aria-labelledby="syntax-ranking-title"
        >
          {languageTabs.length > 0 && (
            <div
              ref={languageOverviewRef}
              className={styles.languageOverview}
              role="group"
              aria-label="語言占比與排名切換"
            >
              <div
                className={styles.languageTrack}
                role="group"
                aria-label="點選占比色塊切換語言"
              >
                {languageTabs.map((language) => (
                  <button
                    type="button"
                    key={language.value}
                    className={styles.languageSegment}
                    data-language={language.value}
                    data-share={language.count}
                    style={{ flexGrow: language.count }}
                    aria-pressed={activeLanguage === language.value}
                    aria-label={`${language.label}，占 ${Math.round(language.percentage * 10) / 10}%`}
                    title={`${language.label} ${Math.round(language.percentage * 10) / 10}%`}
                    onClick={() => {
                      setSelectedLanguage(language.value);
                      setExpandedSyntaxId(null);
                    }}
                  >
                    <span className={styles.segmentPercentage}>
                      {Math.round(language.percentage * 10) / 10}%
                    </span>
                  </button>
                ))}
              </div>

              <div className={styles.languageTabs}>
                {languageTabs.map((language) => {
                  const percentage = Math.round(language.percentage * 10) / 10;

                  return (
                    <button
                      key={language.value}
                      type="button"
                      className={`${styles.languageTab} ${
                        activeLanguage === language.value
                          ? styles.languageTabActive
                          : ""
                      }`}
                      data-language={language.value}
                      data-count={language.count}
                      style={{ flexGrow: language.count }}
                      aria-pressed={activeLanguage === language.value}
                      aria-label={`${language.label}，占 ${percentage}%`}
                      title={`${language.label} ${percentage}%`}
                      onClick={() => {
                        setSelectedLanguage(language.value);
                        setExpandedSyntaxId(null);
                      }}
                    >
                      <span className={styles.languageTabLabel}>
                        <span>{language.label}</span>{" "}
                        <span className={styles.languagePercentage}>
                          {percentage}%
                        </span>
                      </span>
                    </button>
                  );
                })}
              </div>
              <div className={styles.compactTabs}>
                <button
                  type="button"
                  className={`${styles.languageTab} ${styles.neighborTab}`}
                  disabled={languageTabs.length < 2}
                  aria-label={`切換至上一個語言：${previousLanguage?.label ?? activeLanguageLabel}`}
                  onClick={() => {
                    if (!previousLanguage) return;
                    setSelectedLanguage(previousLanguage.value);
                    setExpandedSyntaxId(null);
                  }}
                >
                  <span aria-hidden="true">‹</span>
                  <span>{previousLanguage?.label}</span>
                </button>
                <div
                  className={`${styles.languageTab} ${styles.currentTab}`}
                  data-rank={activeLanguageIndex}
                  aria-live="polite"
                  aria-atomic="true"
                >
                  {activeLanguageLabel}
                </div>
                <button
                  type="button"
                  className={`${styles.languageTab} ${styles.neighborTab}`}
                  disabled={languageTabs.length < 2}
                  aria-label={`切換至下一個語言：${nextLanguage?.label ?? activeLanguageLabel}`}
                  onClick={() => {
                    if (!nextLanguage) return;
                    setSelectedLanguage(nextLanguage.value);
                    setExpandedSyntaxId(null);
                  }}
                >
                  <span>{nextLanguage?.label}</span>
                  <span aria-hidden="true">›</span>
                </button>
              </div>
            </div>
          )}
          <div className={styles.card}>
            <div className={styles.heading}>
              <h2 id="syntax-ranking-title">{activeLanguageLabel} 常用語法</h2>
              <span>共 {usages.length} 種語法</span>
            </div>
            {usages.length === 0 ? (
              <p className={styles.noUsages}>
                目前尚無語法使用統計。已儲存的程式碼尚未辨識到目前支援的語法項目。
              </p>
            ) : (
              <ol className={styles.list}>
                {usages.map((syntax, index) => {
                  // 第一名為滿格，其餘依使用次數比例顯示
                  const width =
                    maxCount > 0 ? (syntax.count / maxCount) * 100 : 0;
                  const isExpanded = expandedSyntaxId === syntax.id;
                  const buttonId = `statistics-button-${syntax.id}`;
                  const panelId = `statistics-panel-${syntax.id}`;
                  const isBookmarked =
                    currentBookmarks?.ids.includes(syntax.id) ?? false;

                  return (
                    <li className={styles.item} key={syntax.id}>
                      <span className={styles.rank} aria-hidden="true">
                        {String(index + 1).padStart(2, "0")}
                      </span>

                      <div className={styles.content}>
                        <div className={styles.label}>
                          <button
                            id={buttonId}
                            type="button"
                            className={styles.name}
                            aria-expanded={isExpanded}
                            aria-controls={panelId}
                            onClick={() => {
                              setExpandedSyntaxId((current) =>
                                current === syntax.id ? null : syntax.id,
                              );
                            }}
                          >
                            {syntax.name}
                          </button>

                          <span className={styles.count}>
                            {syntax.count} 次
                          </span>
                        </div>

                        <div className={styles.track} aria-hidden="true">
                          <div
                            className={styles.bar}
                            style={{ width: `${width}%` }}
                          />
                        </div>

                        <div
                          id={panelId}
                          className={styles.syntaxDetails}
                          role="region"
                          aria-labelledby={buttonId}
                          hidden={!isExpanded}
                        >
                          <div className={styles.detailsHeading}>
                            <button
                              type="button"
                              className={`${styles.bookmarkButton} ${
                                isBookmarked ? styles.bookmarked : ""
                              }`}
                              aria-label={
                                isBookmarked
                                  ? `取消收藏 ${syntax.name}`
                                  : `收藏 ${syntax.name}`
                              }
                              aria-pressed={isBookmarked}
                              title={isBookmarked ? "取消收藏" : "收藏"}
                              disabled={
                                !currentBookmarks ||
                                currentBookmarks.error ||
                                isBookmarkSaving
                              }
                              onClick={() => {
                                void toggleBookmark(syntax.id);
                              }}
                            >
                              <svg
                                viewBox="0 0 24 24"
                                width="22"
                                height="22"
                                fill={isBookmarked ? "currentColor" : "none"}
                                stroke="currentColor"
                                strokeWidth="1.5"
                                strokeLinejoin="round"
                                aria-hidden="true"
                              >
                                <path d="M6 3h12v18l-6-4-6 4V3Z" />
                              </svg>
                            </button>

                            <h3>
                              {syntax.display_label
                                ? `${syntax.display_label} · 語法解釋：`
                                : "語法解釋"}
                            </h3>
                          </div>

                          {currentBookmarks?.error && (
                            <p className={styles.bookmarkNotice} role="alert">
                              無法載入收藏清單，請重新整理再試。
                            </p>
                          )}

                          {bookmarkNotice && (
                            <p className={styles.bookmarkNotice} role="alert">
                              {bookmarkNotice}
                            </p>
                          )}

                          <p>{syntax.summary}</p>

                          {isExpanded && syntax.example_code && (
                            <div className={styles.codeExample}>
                              <CodeExample value={syntax.example_code} />
                            </div>
                          )}
                        </div>
                      </div>
                    </li>
                  );
                })}
              </ol>
            )}
          </div>
        </section>
      )}
    </>
  );
}
