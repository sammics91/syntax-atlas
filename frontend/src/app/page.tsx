"use client";

import { Suspense, useEffect, useRef, useState } from "react";
import { useSearchParams } from "next/navigation";

import AuthDialog from "@/components/AuthDialog";
import { useAuth } from "@/components/AuthProvider";

import styles from "./page.module.css";

// 分析結果的型別
type SyntaxResult = {
  slug: string;
  name: string;
  display_label: string | null;
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
  return (
    <Suspense fallback={<p role="status">正在載入頁面…</p>}>
      <HomePageRoute />
    </Suspense>
  );
}

function HomePageRoute() {
  // 取得網址的 record
  const searchParams = useSearchParams();
  const recordId = searchParams.get("record");

  return <HomeEditor key={recordId ?? "new"} recordId={recordId} />;
}

function HomeEditor({ recordId }: { recordId: string | null }) {
  const [title, setTitle] = useState("");
  const [code, setCode] = useState("");
  const [result, setResult] = useState<AnalysisResult | null>(null);
  const [error, setError] = useState("");
  const [isAnalyzing, setIsAnalyzing] = useState(false);
  const [expandedSlug, setExpandedSlug] = useState<string | null>(null);

  const { user, isAuthLoading, authError, completeSignin } = useAuth();

  const [isSaving, setIsSaving] = useState(false);
  const [savedRecordNumber, setSavedRecordNumber] = useState<number | null>(
    null,
  );
  const [isSaveAuthOpen, setIsSaveAuthOpen] = useState(false);

  const savingRef = useRef(false);
  const resultScrollRef = useRef<HTMLDivElement>(null);

  // 目前開啟的原紀錄
  const [editingRecord, setEditingRecord] = useState<{
    id: number;
    record_number: number;
    user_id: number;
  } | null>(null);

  const [recordError, setRecordError] = useState("");

  // 有指定紀錄時，必須先成功讀取才能操作
  const isEditorReady =
    recordId === null ||
    (user !== null &&
      editingRecord !== null &&
      editingRecord.user_id === user.id &&
      String(editingRecord.id) === recordId);

  // 開啟編輯網址時，讀取原本儲存的名稱與程式碼
  useEffect(() => {
    if (recordId === null) return;

    setEditingRecord(null);
    setRecordError("");
    setTitle("");
    setCode("");
    setResult(null);
    setExpandedSlug(null);
    setSavedRecordNumber(null);
    setError("");

    if (!/^[1-9]\d*$/.test(recordId)) {
      setRecordError("紀錄編號不正確。");
      return;
    }

    if (isAuthLoading || !user) return;

    const controller = new AbortController();
    const currentUserId = user.id;

    async function loadRecord() {
      try {
        const response = await fetch(`/api/records/${recordId}`, {
          credentials: "include",
          cache: "no-store",
          signal: controller.signal,
        });

        const data = await response.json().catch(() => null);

        if (!response.ok) {
          throw new Error(
            typeof data?.detail === "string"
              ? data.detail
              : "無法取得這筆程式碼紀錄，請稍後再試。",
          );
        }

        if (
          !data ||
          String(data.id) !== recordId ||
          typeof data.record_number !== "number" ||
          typeof data.code !== "string" ||
          data.language !== "python"
        ) {
          throw new Error("紀錄內容格式異常，無法開啟編輯。");
        }

        if (controller.signal.aborted) return;

        setTitle(data.title ?? "");
        setCode(data.code);
        setEditingRecord({
          id: data.id,
          record_number: data.record_number,
          user_id: currentUserId,
        });
      } catch (error) {
        if (controller.signal.aborted) return;

        setRecordError(
          error instanceof Error
            ? error.message
            : "無法取得這筆程式碼紀錄，請稍後再試。",
        );
      }
    }

    void loadRecord();

    return () => controller.abort();
  }, [recordId, user?.id, isAuthLoading]);

  // 分析成功、結果顯示後，將儲存按鈕與結果移到可見的位置
  useEffect(() => {
    if (!result) return;

    const frameId = requestAnimationFrame(() => {
      const reduceMotion = window.matchMedia(
        "(prefers-reduced-motion: reduce)",
      ).matches;

      resultScrollRef.current?.scrollIntoView({
        behavior: reduceMotion ? "instant" : "smooth",
        block: "start",
      });
    });

    return () => cancelAnimationFrame(frameId);
  }, [result]);

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
      setResult({
        ...analysis,
        syntaxes: [...analysis.syntaxes].sort((a, b) => b.count - a.count),
      });
    } catch {
      setError("無法連線至分析服務，請確認後端已啟動。");
    } finally {
      setIsAnalyzing(false);
    }
  }

  // 將目前的程式碼儲存為會員紀錄
  async function handleSave() {
    if (
      !isEditorReady ||
      savingRef.current ||
      !result?.valid ||
      savedRecordNumber !== null
    ) {
      return;
    }

    savingRef.current = true;
    setIsSaving(true);
    setError("");

    try {
      const response = await fetch(
        editingRecord ? `/api/records/${editingRecord.id}` : "/api/records",
        {
          method: editingRecord ? "PUT" : "POST",
          credentials: "include",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            title: title.trim() || null,
            language: result.language,
            code,
          }),
        },
      );

      const data = await response.json().catch(() => null);

      if (!response.ok) {
        if (response.status === 401) {
          setError("登入已失效，請重新登入後再儲存。");
          setIsSaveAuthOpen(true);
          return;
        }

        const message =
          typeof data?.detail === "string"
            ? data.detail
            : typeof data?.detail?.message === "string"
              ? data.detail.message
              : "無法儲存程式碼紀錄，請稍後再試。";

        setError(message);
        return;
      }

      setSavedRecordNumber(data.record_number);
    } catch {
      setError("無法連線至儲存服務，請稍後再試。");
    } finally {
      savingRef.current = false;
      setIsSaving(false);
    }
  }

  // 尚未分析時先分析，分析成功後才儲存
  function handlePrimaryAction() {
    if (isAnalyzing || isSaving || savingRef.current) return;

    if (!result) {
      void handleAnalyze();
      return;
    }

    if (isAuthLoading) return;

    if (authError) {
      setError("無法確認登入狀態，請重新整理後再儲存。");
      return;
    }

    if (!user) {
      setIsSaveAuthOpen(true);
      return;
    }

    void handleSave();
  }

  if (recordId !== null && !isEditorReady) {
    return (
      <>
        <h1 className="page-title">編輯程式碼紀錄</h1>

        {recordError ? (
          <p className={styles.error} role="alert">
            {recordError}
          </p>
        ) : isAuthLoading ? (
          <p role="status">正在確認登入狀態…</p>
        ) : authError ? (
          <p className={styles.error} role="alert">
            {authError}
          </p>
        ) : !user ? (
          <>
            <p>請先登入，才能開啟這筆程式碼紀錄。</p>

            <button
              type="button"
              className={styles.analyzeButton}
              onClick={() => setIsSaveAuthOpen(true)}
            >
              登入
            </button>
          </>
        ) : (
          <p role="status">正在載入程式碼紀錄…</p>
        )}

        {isSaveAuthOpen && (
          <AuthDialog
            onClose={() => setIsSaveAuthOpen(false)}
            onSignedIn={(currentUser) => {
              completeSignin(currentUser);
              setIsSaveAuthOpen(false);
            }}
          />
        )}
      </>
    );
  }

  return (
    <>
      <h1 className="page-title">
        {editingRecord
          ? `編輯程式碼紀錄 #${editingRecord.record_number}`
          : "這次，你用了哪些語法？"}
      </h1>

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
            disabled={isAnalyzing || isSaving}
            onChange={(event) => {
              setTitle(event.target.value);
              setSavedRecordNumber(null);
              setError("");
            }}
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
            disabled={isAnalyzing || isSaving}
            value={code}
            onChange={(event) => {
              setCode(event.target.value);
              setResult(null);
              setExpandedSlug(null);
              setError("");
              setSavedRecordNumber(null);
            }}
          />
        </div>

        {error && (
          <p className={styles.error} role="alert">
            {error}
          </p>
        )}

        <div ref={resultScrollRef} className={styles.actions}>
          <div className={styles.actionInfo}>
            <p className={styles.characterCount}>
              目前輸入 {code.length} 個字元
            </p>

            {savedRecordNumber !== null ? (
              <p className={styles.saveMessage} role="status">
                程式碼已儲存，紀錄編號 #{savedRecordNumber}。
              </p>
            ) : !isAuthLoading && !user ? (
              <p className={styles.saveHint}>
                登入後可儲存紀錄，再次開啟與編輯。
              </p>
            ) : null}
          </div>

          <button
            type="button"
            className={styles.analyzeButton}
            onClick={handlePrimaryAction}
            disabled={
              isAnalyzing ||
              isSaving ||
              savedRecordNumber !== null ||
              (Boolean(result) && isAuthLoading)
            }
          >
            {isAnalyzing
              ? "分析中…"
              : isSaving
                ? "儲存中…"
                : savedRecordNumber !== null
                  ? "已儲存"
                  : !result
                    ? "分析程式碼 →"
                    : isAuthLoading
                      ? "確認登入狀態中…"
                      : user
                        ? editingRecord
                          ? "儲存變更"
                          : "儲存程式碼"
                        : "登入並儲存"}
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
                      <span className={styles.syntaxName}>
                        {syntax.name}
                        {syntax.display_label &&
                          syntax.display_label !== syntax.name && (
                            <span>{"　· "}{syntax.display_label}</span>
                          )}
                      </span>

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

      {isSaveAuthOpen && (
        <AuthDialog
          onClose={() => setIsSaveAuthOpen(false)}
          onSignedIn={(currentUser) => {
            completeSignin(currentUser);
            setIsSaveAuthOpen(false);
          }}
        />
      )}
    </>
  );
}
