"use client";

import { useState } from "react";
import styles from "./page.module.css";

// 分析結果的型別
type SyntaxResult = {
  slug: string;
  name: string;
  count: number;
  summary: string;
  example_code: string;
};

type AnalysisError = {
  message: string;
  line: number | null;
  column: number | null;
};

type AnalysisResult = {
  language: string;
  valid: boolean;
  syntaxes: SyntaxResult[];
  errors: AnalysisError[];
};

export default function HomePage() {
  const [title, setTitle] = useState("");
  const [code, setCode] = useState("");
  const [result, setResult] = useState<AnalysisResult | null>(null);
  const [error, setError] = useState("");
  const [isAnalyzing, setIsAnalyzing] = useState(false);
  const [expandedSlug, setExpandedSlug] = useState<string | null>(null);

  async function handleAnalyze() {
    if (isAnalyzing) return;

    setResult(null);
    setExpandedSlug(null);
    setError("");

    if (!code.trim()) {
      setError("請輸入程式碼內容。");
      return;
    }

    if (code.length > 20000) {
      setError("程式碼內容不能超過 20,000 個字元。");
      return;
    }

    setIsAnalyzing(true);

    try {
      const response = await fetch("/api/analyses", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          language: "python",
          code,
        }),
      });

      const data = await response.json().catch(() => null);

      // 檢查分析請求是否成功
      if (!response.ok) {
        if (typeof data?.detail === "string") {
          setError(data.detail);
        } else {
          setError(
            `分析請求失敗（${response.status}），請確認內容或稍後再試。`,
          );
        }

        return;
      }

      // 檢查回傳資料的基本結構
      if (
        !data ||
        typeof data.language !== "string" ||
        typeof data.valid !== "boolean" ||
        !Array.isArray(data.syntaxes) ||
        !Array.isArray(data.errors)
      ) {
        setError("分析結果格式異常，請稍後再試。");
        return;
      }

      const analysis: AnalysisResult = data;

      // 檢查是否符合所選語言的語法
      if (!analysis.valid) {
        const firstError = analysis.errors[0];
        const location = firstError?.line ? `第 ${firstError.line} 行：` : "";

        const languageName =
          analysis.language === "python" ? "Python" : analysis.language;

        setError(
          `無法以 ${languageName} 語法解析。${location}${
            firstError?.message ?? "請確認程式碼語法完整。"
          }`,
        );

        return;
      }

      // 保存成功的分析結果
      setResult(analysis);
    } catch {
      setError("無法連線至分析服務，請確認後端已啟動。");
    } finally {
      setIsAnalyzing(false);
    }
  }

  return (
    <>
      <h1 className="page-title">這次，你用了哪些語法？</h1>

      <p className="page-description">貼上程式碼，讓每一次練習都留下足跡。</p>

      <section className={styles.editor} aria-label="程式碼分析輸入區">
        <div className={styles.titleField}>
          <label htmlFor="code-title">程式碼名稱</label>

          <input
            id="code-title"
            name="title"
            type="text"
            placeholder="ex: 購物清單練習 (選填)"
            maxLength={30}
            value={title}
            onChange={(event) => setTitle(event.target.value)}
          />
        </div>

        <div className={styles.codeField}>
          <textarea
            id="code-content"
            name="code"
            aria-label="程式碼內容"
            placeholder="在這裡貼上你的 Python 程式碼"
            spellCheck={false}
            autoCapitalize="off"
            autoCorrect="off"
            disabled={isAnalyzing}
            value={code}
            onChange={(event) => {
              setCode(event.target.value);
              setResult(null);
              setExpandedSlug(null);
              setError("");
            }}
          />
        </div>

        {error && (
          <p className={styles.error} role="alert">
            {error}
          </p>
        )}

        <div className={styles.actions}>
          <p className={styles.characterCount}>目前輸入 {code.length} 個字元</p>

          <button
            type="button"
            className={styles.analyzeButton}
            onClick={handleAnalyze}
            disabled={isAnalyzing}
          >
            {isAnalyzing ? "分析中…" : "分析程式碼 →"}
          </button>
        </div>
      </section>

      {result && (
        <section className={styles.result} aria-labelledby="analysis-title">
          <div className={styles.resultHeader}>
            <h2 id="analysis-title" className={styles.resultTitle}>
              本次辨識到的語法
            </h2>

            <span>共 {result.syntaxes.length} 種</span>
          </div>

          {result.syntaxes.length === 0 ? (
            <p className={styles.resultNote}>
              程式碼符合所選語言的語法，但未辨識到目前支援的語法項目。
            </p>
          ) : (
            <ul className={styles.syntaxList}>
              {result.syntaxes.map((syntax) => {
                const isExpanded = expandedSlug === syntax.slug;
                const buttonId = `syntax-button-${syntax.slug}`;
                const panelId = `syntax-panel-${syntax.slug}`;

                return (
                  <li key={syntax.slug} className={styles.syntaxItem}>
                    <button
                      id={buttonId}
                      type="button"
                      className={styles.syntaxRow}
                      aria-expanded={isExpanded}
                      aria-controls={panelId}
                      onClick={() => {
                        setExpandedSlug((current) =>
                          current === syntax.slug ? null : syntax.slug,
                        );
                      }}
                    >
                      <span className={styles.syntaxName}>{syntax.name}</span>

                      <span className={styles.syntaxCount}>
                        {syntax.count} 次
                      </span>

                      <span className={styles.syntaxSymbol} aria-hidden="true">
                        {isExpanded ? "−" : "+"}
                      </span>
                    </button>

                    <div
                      id={panelId}
                      className={styles.syntaxDetails}
                      role="region"
                      aria-labelledby={buttonId}
                      hidden={!isExpanded}
                    >
                      <h3>語法解釋</h3>
                      <p>{syntax.summary}</p>

                      <pre>
                        <code>{syntax.example_code}</code>
                      </pre>
                    </div>
                  </li>
                );
              })}
            </ul>
          )}

          <p className={styles.resultNote}>
            次數依程式碼中的出現次數計算，並非實際執行次數。
          </p>
        </section>
      )}
    </>
  );
}
