"use client";

import { useEffect, useRef, useState } from "react";

import AuthDialog from "@/components/AuthDialog";
import { useAuth } from "@/components/AuthProvider";

import styles from "./page.module.css";

type DictionaryLanguage = "python" | "html";

const DICTIONARY_LANGUAGES: {
  value: DictionaryLanguage;
  label: string;
}[] = [
  { value: "python", label: "Python" },
  { value: "html", label: "HTML" },
];

type SyntaxEntry = {
  id: number;
  language: DictionaryLanguage;
  slug: string;
  name: string;
  display_label: string | null;
  category_name: string;
  summary: string;
  example_description: string;
  example_code: string;
  source_url: string | null;
};

type MemberBookmarks = {
  ownerId: number;
  ids: number[];
  error: boolean;
};

// 搜尋時忽略大小寫、全半形與排版空白
function normalizeSearch(text: string) {
  return text.normalize("NFKC").toLowerCase().replace(/\s+/g, "");
}

function searchRank(syntax: SyntaxEntry, keyword: string) {
  const query = normalizeSearch(keyword);
  if (!query) return 0;

  const names = [syntax.name, syntax.display_label].map((text) =>
    normalizeSearch(text ?? ""),
  );

  if (names.some((name) => name === query)) return 0;
  if (names.some((name) => name.startsWith(query))) return 1;
  if (names.some((name) => name.includes(query))) return 2;
  if (normalizeSearch(syntax.summary ?? "").includes(query)) return 3;
  if (normalizeSearch(syntax.example_description ?? "").includes(query))
    return 4;
  if (normalizeSearch(syntax.category_name ?? "").includes(query)) return 5;

  return Infinity;
}

// 辭典預設分組：英文名稱、數字與常值、符號
function dictionaryGroup(syntax: SyntaxEntry) {
  const name = normalizeSearch(syntax.name);
  if (/^[0-9]/.test(name) || /-(literal|constant)$/.test(syntax.slug)) return 1;
  return /^[a-z]/.test(name) ? 0 : 2;
}

function compareDictionaryEntries(a: SyntaxEntry, b: SyntaxEntry) {
  const groupA = dictionaryGroup(a);
  const groupB = dictionaryGroup(b);
  if (groupA !== groupB) return groupA - groupB;

  const nameA = normalizeSearch(a.name);
  const nameB = normalizeSearch(b.name);

  if (groupA === 2) {
    // 同族符號相鄰，例如 +、+=、+x，以及 *、**、**=。
    const families = [
      "+",
      "-",
      "*",
      "/",
      "%",
      "@",
      "<",
      ">",
      "=",
      "!",
      "&",
      "|",
      "^",
      "~",
      ":",
      "[",
      "(",
      "{",
    ];
    const familyIndex = (name: string) => {
      const index = families.indexOf(name[0]);
      return index === -1 ? families.length : index;
    };
    const familyDifference = familyIndex(nameA) - familyIndex(nameB);
    if (familyDifference !== 0) return familyDifference;
    if (nameA !== nameB) return nameA < nameB ? -1 : 1;
  }

  return (
    nameA.localeCompare(nameB, "en", { sensitivity: "base" }) || a.id - b.id
  );
}

export default function DictionaryPage() {
  const { user, isAuthLoading, authError, completeSignin } = useAuth();
  const [syntaxes, setSyntaxes] = useState<SyntaxEntry[]>([]);
  const [expandedSlug, setExpandedSlug] = useState<string | null>(null);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState("");
  const [searchInput, setSearchInput] = useState("");
  // null 代表依搜尋結果自動選擇；點擊頁籤後使用指定語言。
  const [selectedLanguage, setSelectedLanguage] =
    useState<DictionaryLanguage | null>(null);
  const [hasSubmittedSearch, setHasSubmittedSearch] = useState(false);
  // 收藏篩選與會員身分綁定
  const [bookmarkFilterOwnerId, setBookmarkFilterOwnerId] = useState<
    number | null
  >(null);
  const [usageState, setUsageState] = useState<{
    userId: number;
    counts: Record<number, number>;
    error: boolean;
  } | null>(null);

  // 會員收藏清單
  const [memberBookmarks, setMemberBookmarks] =
    useState<MemberBookmarks | null>(null);

  // 收藏操作與登入視窗
  const [isBookmarkSaving, setIsBookmarkSaving] = useState(false);
  const [bookmarkNotice, setBookmarkNotice] = useState("");
  const [isBookmarkAuthOpen, setIsBookmarkAuthOpen] = useState(false);

  const bookmarkSavingRef = useRef(false);

  // 只使用目前會員的收藏，避免切換帳號時顯示別人的資料
  const currentBookmarks =
    user && memberBookmarks?.ownerId === user.id ? memberBookmarks : null;

  // 登入後取得自己的收藏清單
  useEffect(() => {
    if (isAuthLoading || !user) return;

    const controller = new AbortController();
    const ownerId = user.id;

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

        const ids = data.bookmarks.map(
          (item: { syntax_id: number }) => item.syntax_id,
        );

        if (!controller.signal.aborted) {
          setMemberBookmarks({
            ownerId,
            ids,
            error: false,
          });
        }
      } catch {
        if (!controller.signal.aborted) {
          setMemberBookmarks({
            ownerId,
            ids: [],
            error: true,
          });
        }
      }
    }

    void loadBookmarks();

    return () => controller.abort();
  }, [user, isAuthLoading]);

  // 只查詢登入會員的累積次數；登出後不顯示會員使用狀態
  useEffect(() => {
    if (isAuthLoading || !user) return;

    const controller = new AbortController();
    const userId = user.id;

    async function loadUsage() {
      try {
        const response = await fetch("/api/statistics?language=all", {
          credentials: "include",
          cache: "no-store",
          signal: controller.signal,
        });

        if (!response.ok) throw new Error("無法取得使用次數");

        const data = await response.json();
        if (!Array.isArray(data.usages)) throw new Error("使用次數格式異常");

        const counts: Record<number, number> = {};
        for (const usage of data.usages) {
          if (typeof usage.id !== "number" || typeof usage.count !== "number") {
            throw new Error("使用次數格式異常");
          }
          counts[usage.id] = usage.count;
        }

        if (!controller.signal.aborted) {
          setUsageState({ userId, counts, error: false });
        }
      } catch {
        if (!controller.signal.aborted) {
          setUsageState({ userId, counts: {}, error: true });
        }
      }
    }

    void loadUsage();
    return () => controller.abort();
  }, [user, isAuthLoading]);

  const currentUsage =
    user && usageState?.userId === user.id ? usageState : null;

  // 進入頁面時取得語法清單
  useEffect(() => {
    const controller = new AbortController();

    async function loadSyntaxes() {
      try {
        const response = await fetch("/api/syntaxes", {
          cache: "no-store",
          signal: controller.signal,
        });

        if (!response.ok) {
          throw new Error("無法取得語法清單");
        }

        const data = await response.json();

        if (!Array.isArray(data.syntaxes)) {
          throw new Error("語法清單格式異常");
        }

        if (!controller.signal.aborted) {
          setSyntaxes(data.syntaxes);
        }
      } catch {
        if (!controller.signal.aborted) {
          setError("無法載入語法辭典，請稍後重新整理再試。");
        }
      } finally {
        if (!controller.signal.aborted) {
          setIsLoading(false);
        }
      }
    }

    loadSyntaxes();

    return () => controller.abort();
  }, []);

  const isSearching = normalizeSearch(searchInput) !== "";

  const isBookmarkFilterActive = Boolean(
    !isAuthLoading &&
    user &&
    bookmarkFilterOwnerId === user.id &&
    currentBookmarks &&
    !currentBookmarks.error,
  );

  // 先選擇全部語法或目前會員的收藏，再搜尋與排序
  const sourceSyntaxes = isBookmarkFilterActive
    ? syntaxes.filter((syntax) => currentBookmarks?.ids.includes(syntax.id))
    : syntaxes;

  // 先跨語言搜尋；相同符合程度時，Python 優先，再依辭典排序。
  const rankedSyntaxes = sourceSyntaxes
    .map((syntax) => ({
      syntax,
      rank: searchRank(syntax, searchInput),
    }))
    .filter(({ rank }) => Number.isFinite(rank))
    .sort(
      (a, b) =>
        a.rank - b.rank ||
        DICTIONARY_LANGUAGES.findIndex(
          (language) => language.value === a.syntax.language,
        ) -
          DICTIONARY_LANGUAGES.findIndex(
            (language) => language.value === b.syntax.language,
          ) ||
        compareDictionaryEntries(a.syntax, b.syntax),
    );

  const matchingSyntaxes = rankedSyntaxes.map(({ syntax }) => syntax);

  // 沒有手動指定頁籤時，搜尋會選擇符合程度最高的語言。
  // 沒搜尋或完全找不到結果時，預設顯示 Python。
  const activeLanguage =
    selectedLanguage ??
    (isSearching ? rankedSyntaxes[0]?.syntax.language : undefined) ??
    "python";

  // 每個語言頁籤各自顯示符合的項目數。
  const languageCounts = {
    python: matchingSyntaxes.filter((syntax) => syntax.language === "python")
      .length,
    html: matchingSyntaxes.filter((syntax) => syntax.language === "html")
      .length,
  };

  // 列表只顯示目前語言，保留上面已完成的搜尋排序。
  const visibleSyntaxes = matchingSyntaxes.filter(
    (syntax) => syntax.language === activeLanguage,
  );

  const currentLanguageSource = sourceSyntaxes.filter(
    (syntax) => syntax.language === activeLanguage,
  );

  function clearSearch() {
    setSearchInput("");
    setSelectedLanguage(null);
    setHasSubmittedSearch(false);
    setExpandedSlug(null);
  }

  async function toggleBookmark(syntaxId: number) {
    if (isAuthLoading || bookmarkSavingRef.current) return;

    setBookmarkNotice("");

    if (authError) {
      setBookmarkNotice("無法確認登入狀態，請重新整理後再試。");
      return;
    }

    if (!user) {
      setIsBookmarkAuthOpen(true);
      return;
    }

    if (!currentBookmarks || currentBookmarks.error) return;

    const ownerId = user.id;
    const wasBookmarked = currentBookmarks.ids.includes(syntaxId);

    bookmarkSavingRef.current = true;
    setIsBookmarkSaving(true);

    try {
      const response = await fetch(`/api/bookmarks/${syntaxId}`, {
        method: wasBookmarked ? "DELETE" : "PUT",
        credentials: "include",
      });

      if (response.status === 401) {
        setBookmarkNotice("登入已失效，請重新登入後再操作。");
        setIsBookmarkAuthOpen(true);
        return;
      }

      if (!response.ok) {
        throw new Error(
          wasBookmarked
            ? "無法取消收藏，請稍後再試。"
            : "無法加入收藏，請稍後再試。",
        );
      }

      // 後端成功後，才更新圖示
      setMemberBookmarks((previous) => {
        if (!previous || previous.ownerId !== ownerId) {
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
      <h1 className="page-title">我的語法辭典</h1>

      <p className="page-description">
        隨時查閱語法說明與範例，掌握已使用與尚未探索的語法。
      </p>

      <form
        className={styles.search}
        role="search"
        onSubmit={(event) => {
          event.preventDefault();
          setSelectedLanguage(null);
          setHasSubmittedSearch(isSearching);
          setExpandedSlug(null);
        }}
      >
        <div className={styles.searchRow}>
          <input
            id="syntax-search"
            type="text"
            enterKeyHint="search"
            aria-label="搜尋語法辭典"
            placeholder="搜尋語法、中文名稱、用途或關鍵字"
            autoComplete="off"
            value={searchInput}
            disabled={isLoading || Boolean(error)}
            onChange={(event) => {
              setSearchInput(event.target.value);
              setSelectedLanguage(null);
              setHasSubmittedSearch(false);
              setExpandedSlug(null);
            }}
          />

          {searchInput && (
            <button
              type="button"
              className={styles.clearSearch}
              aria-label="清除搜尋"
              onClick={clearSearch}
            >
              <span aria-hidden="true">×</span>
              <span>清除搜尋</span>
            </button>
          )}

          <button
            type="submit"
            className={styles.submitSearch}
            disabled={isLoading || Boolean(error)}
          >
            搜尋
          </button>
        </div>
      </form>

      {bookmarkNotice && (
        <p className={styles.error} role="alert">
          {bookmarkNotice}
        </p>
      )}

      {!isAuthLoading && user && currentBookmarks?.error && (
        <p className={styles.error} role="alert">
          無法載入收藏清單，請重新整理再試。
        </p>
      )}

      {!isLoading &&
        !error &&
        !isBookmarkFilterActive &&
        syntaxes.length > 0 &&
        isSearching &&
        hasSubmittedSearch &&
        matchingSyntaxes.length === 0 && (
          <p className={styles.noResults} role="status">
            找不到符合的語法，請試試其他關鍵字。
          </p>
        )}

      {isLoading ? (
        <p className={styles.message} role="status">
          載入語法資料中…
        </p>
      ) : error ? (
        <p className={styles.error} role="alert">
          {error}
        </p>
      ) : (
        <section className={styles.dictionary} aria-labelledby="language-title">
          <div className={styles.summary}>
            <div
              id="language-title"
              className={styles.languageTabs}
              role="group"
              aria-label="辭典語言"
            >
              {DICTIONARY_LANGUAGES.map((language) => (
                <button
                  key={language.value}
                  type="button"
                  className={`${styles.languageTab} ${
                    activeLanguage === language.value
                      ? styles.languageTabActive
                      : ""
                  }`}
                  aria-pressed={activeLanguage === language.value}
                  aria-label={`${language.label}，${
                    isBookmarkFilterActive ? "收藏" : "共"
                  } ${languageCounts[language.value]} 項`}
                  onClick={() => {
                    setSelectedLanguage(language.value);
                    setExpandedSlug(null);
                  }}
                >
                  <span>{language.label}</span>

                  <span className={styles.languageCount}>
                    ({languageCounts[language.value]})
                  </span>
                </button>
              ))}
            </div>

            {!isAuthLoading && user && (
              <button
                type="button"
                className={`${styles.bookmarkFilter} ${
                  isBookmarkFilterActive ? styles.bookmarkFilterActive : ""
                }`}
                aria-pressed={isBookmarkFilterActive}
                disabled={
                  isLoading ||
                  Boolean(error) ||
                  isBookmarkSaving ||
                  !currentBookmarks ||
                  currentBookmarks.error
                }
                onClick={() => {
                  setBookmarkFilterOwnerId(
                    isBookmarkFilterActive ? null : user.id,
                  );

                  // 依篩選後的搜尋結果重新選擇語言，並收合說明。
                  setSelectedLanguage(null);
                  setExpandedSlug(null);
                }}
              >
                <span aria-hidden="true">
                  {isBookmarkFilterActive ? "●" : "○"}
                </span>
                <span>僅顯示我的收藏</span>
              </button>
            )}
          </div>

          {syntaxes.length === 0 ? (
            <p className={styles.message}>目前尚無語法資料。</p>
          ) : visibleSyntaxes.length === 0 ? (
            <p className={styles.emptyBookmarks} role="status">
              {isBookmarkFilterActive
                ? currentLanguageSource.length === 0
                  ? "此語言尚未收藏任何語法，可點選語法前方的書籤圖示加入收藏。"
                  : "此語言的收藏中找不到符合的語法，請試試其他關鍵字。"
                : isSearching
                  ? "此語言找不到符合的語法，請切換其他語言或修改關鍵字。"
                  : "此語言目前尚無語法資料。"}
            </p>
          ) : (
            <ul className={styles.list}>
              {visibleSyntaxes.map((syntax) => {
                const usageCount = currentUsage?.counts[syntax.id] ?? 0;
                const hasUsed = Boolean(
                  user && currentUsage && !currentUsage.error && usageCount > 0,
                );
                const isBookmarked =
                  currentBookmarks?.ids.includes(syntax.id) ?? false;
                const bookmarkDisabled =
                  isAuthLoading ||
                  isBookmarkSaving ||
                  Boolean(
                    user && (!currentBookmarks || currentBookmarks.error),
                  );
                const isExpanded = expandedSlug === syntax.slug;
                const buttonId = `dictionary-button-${syntax.slug}`;
                const panelId = `dictionary-panel-${syntax.slug}`;

                return (
                  <li
                    key={syntax.slug}
                    className={`${styles.item} ${
                      isExpanded ? styles.expanded : ""
                    }`}
                  >
                    <div className={styles.headingRow}>
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
                        disabled={bookmarkDisabled}
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

                      <button
                        id={buttonId}
                        type="button"
                        className={styles.row}
                        aria-expanded={isExpanded}
                        aria-controls={panelId}
                        onClick={() => {
                          setExpandedSlug((current) =>
                            current === syntax.slug ? null : syntax.slug,
                          );
                        }}
                      >
                        <span
                          className={`${styles.name} ${
                            hasUsed ? styles.usedName : ""
                          }`}
                        >
                          {syntax.name}

                          {syntax.display_label &&
                            syntax.display_label !== syntax.name && (
                              <span className={styles.displayLabel}>
                                {"　· "}
                                {syntax.display_label}
                              </span>
                            )}
                        </span>

                        {!isAuthLoading && user && (
                          <span
                            className={`${styles.usage} ${
                              hasUsed ? styles.usedUsage : ""
                            }`}
                          >
                            {!currentUsage
                              ? "載入中…"
                              : currentUsage.error
                                ? "次數載入失敗"
                                : hasUsed
                                  ? `✓ 已使用 ${usageCount} 次`
                                  : "○ 尚未使用"}
                          </span>
                        )}

                        <span aria-hidden="true">{isExpanded ? "−" : "+"}</span>
                      </button>
                    </div>

                    <div
                      id={panelId}
                      className={styles.details}
                      role="region"
                      aria-labelledby={buttonId}
                      hidden={!isExpanded}
                    >
                      <div className={styles.explanation}>
                        <h3>語法解釋：</h3>
                        <p>{syntax.summary}</p>

                        <pre>
                          <code>{syntax.example_code}</code>
                        </pre>
                        {syntax.source_url?.startsWith("https://") && (
                          <a
                            className={styles.sourceLink}
                            href={syntax.source_url}
                            target="_blank"
                            rel="noopener noreferrer"
                          >
                            查看官方文件 ↗
                          </a>
                        )}
                      </div>
                    </div>
                  </li>
                );
              })}
            </ul>
          )}
        </section>
      )}
      {isBookmarkAuthOpen && (
        <AuthDialog
          onClose={() => setIsBookmarkAuthOpen(false)}
          onSignedIn={(currentUser) => {
            completeSignin(currentUser);
            setIsBookmarkAuthOpen(false);
            setBookmarkNotice("");
          }}
        />
      )}
    </>
  );
}
