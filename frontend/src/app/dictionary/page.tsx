"use client";

import { useEffect, useState } from "react";

import { useAuth } from "@/components/AuthProvider";

import styles from "./page.module.css";

type SyntaxEntry = {
  id: number;
  slug: string;
  name: string;
  display_label: string | null;
  summary: string;
  example_code: string;
};

export default function DictionaryPage() {
  const { user, isAuthLoading } = useAuth();
  const [syntaxes, setSyntaxes] = useState<SyntaxEntry[]>([]);
  const [expandedSlug, setExpandedSlug] = useState<string | null>(null);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState("");
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

  return (
    <>
      <h1 className="page-title">我的語法辭典</h1>

      <p className="page-description">
        隨時查閱語法說明與範例，掌握已使用與尚未探索的語法。
      </p>

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
            Python · 共 {syntaxes.length} 項
          </h2>

          {syntaxes.length === 0 ? (
            <p className={styles.message}>目前尚無語法資料。</p>
          ) : (
            <ul className={styles.list}>
              {syntaxes.map((syntax) => {
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
