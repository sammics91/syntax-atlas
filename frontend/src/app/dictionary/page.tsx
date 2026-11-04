"use client";

import { useEffect, useState } from "react";
import styles from "./page.module.css";

type SyntaxEntry = {
  slug: string;
  name: string;
  summary: string;
  example_code: string;
};

export default function DictionaryPage() {
  const [syntaxes, setSyntaxes] = useState<SyntaxEntry[]>([]);
  const [expandedSlug, setExpandedSlug] = useState<string | null>(null);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState("");

  // 進入頁面時取得語法清單
  useEffect(() => {
    const controller = new AbortController();

    async function loadSyntaxes() {
      try {
        const response = await fetch("/api/syntaxes", {
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
                      <span>{syntax.name}</span>

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
