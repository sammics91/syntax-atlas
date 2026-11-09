"use client";

import { useEffect, useState } from "react";

import { useAuth } from "@/components/AuthProvider";

import styles from "./page.module.css";

type SyntaxEntry = {
  id: number;
  slug: string;
  name: string;
  display_label: string | null;
  category_name: string;
  summary: string;
  example_description: string;
  example_code: string;
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
  if (normalizeSearch(syntax.example_description ?? "").includes(query)) return 4;
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
      "+", "-", "*", "/", "%", "@", "<", ">", "=", "!",
      "&", "|", "^", "~", ":", "[", "(", "{",
    ];
    const familyIndex = (name: string) => {
      const index = families.indexOf(name[0]);
      return index === -1 ? families.length : index;
    };
    const familyDifference = familyIndex(nameA) - familyIndex(nameB);
    if (familyDifference !== 0) return familyDifference;
    if (nameA !== nameB) return nameA < nameB ? -1 : 1;
  }

  return nameA.localeCompare(nameB, "en", { sensitivity: "base" }) || a.id - b.id;
}

export default function DictionaryPage() {
  const { user, isAuthLoading } = useAuth();
  const [syntaxes, setSyntaxes] = useState<SyntaxEntry[]>([]);
  const [expandedSlug, setExpandedSlug] = useState<string | null>(null);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState("");
  const [searchInput, setSearchInput] = useState("");
  const [hasSubmittedSearch, setHasSubmittedSearch] = useState(false);
  const [usageState, setUsageState] = useState<{
    userId: number;
    counts: Record<number, number>;
    error: boolean;
  } | null>(null);

  // 只查詢登入會員的累積次數；登出後不顯示會員使用狀態
  useEffect(() => {
    if (isAuthLoading || !user) return;

    const controller = new AbortController();
    const userId = user.id;

    async function loadUsage() {
      try {
        const response = await fetch("/api/statistics", {
          credentials: "include",
          cache: "no-store",
          signal: controller.signal,
        });

        if (!response.ok) throw new Error("無法取得使用次數");

        const data = await response.json();
        if (!Array.isArray(data.usages)) throw new Error("使用次數格式異常");

        const counts: Record<number, number> = {};
        for (const usage of data.usages) {
          if (
            typeof usage.id !== "number" ||
            typeof usage.count !== "number"
          ) {
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
  // 搜尋先依符合程度；沒有搜尋或同等符合時，使用固定辭典排序
  const visibleSyntaxes = syntaxes
    .map((syntax) => ({ syntax, rank: searchRank(syntax, searchInput) }))
    .filter(({ rank }) => Number.isFinite(rank))
    .sort((a, b) =>
      a.rank - b.rank || compareDictionaryEntries(a.syntax, b.syntax),
    )
    .map(({ syntax }) => syntax);

  function clearSearch() {
    setSearchInput("");
    setHasSubmittedSearch(false);
    setExpandedSlug(null);
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

      {!isLoading && !error && syntaxes.length > 0 &&
        isSearching && hasSubmittedSearch && visibleSyntaxes.length === 0 && (
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
          <h2 id="language-title" className={styles.languageTitle}>
            Python · 共 {visibleSyntaxes.length} 項
          </h2>

          {syntaxes.length === 0 ? (
            <p className={styles.message}>目前尚無語法資料。</p>
          ) : (
            <ul className={styles.list}>
              {visibleSyntaxes.map((syntax) => {
                const usageCount = currentUsage?.counts[syntax.id] ?? 0;
                const hasUsed = Boolean(
                  user && currentUsage && !currentUsage.error && usageCount > 0,
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
                        className={`${styles.name} ${hasUsed ? styles.usedName : ""}`}
                      >
                        {syntax.name}
                        {syntax.display_label &&
                          syntax.display_label !== syntax.name && (
                            <span className={styles.displayLabel}>
                              {"　· "}{syntax.display_label}
                            </span>
                          )}
                      </span>

                      {!isAuthLoading && user && (
                        <span
                          className={`${styles.usage} ${hasUsed ? styles.usedUsage : ""}`}
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

                    <div
                      id={panelId}
                      className={styles.details}
                      role="region"
                      aria-labelledby={buttonId}
                      hidden={!isExpanded}
                    >
                      <div className={styles.explanation}>
                        <h3>語法解釋</h3>
                        <p>{syntax.summary}</p>

                        <pre>
                          <code>{syntax.example_code}</code>
                        </pre>
                      </div>
                    </div>
                  </li>
                );
              })}
            </ul>
          )}
        </section>
      )}
    </>
  );
}
