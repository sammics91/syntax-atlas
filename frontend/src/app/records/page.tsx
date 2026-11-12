"use client";

import { useEffect, useRef, useState } from "react";
import Link from "next/link";

import { useAuth } from "@/components/AuthProvider";

import styles from "./page.module.css";

type CodeRecord = {
  id: number;
  record_number: number;
  title: string | null;
  language: string;
  code: string | null;
  code_deleted_at: string | null;
  created_at: string;
  updated_at: string;
  syntax_count: number;
};

type DeleteMode = "code-only" | "all";

export default function RecordsPage() {
  const { user } = useAuth();
  const userId = user?.id;

  const [records, setRecords] = useState<CodeRecord[]>([]);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState("");

  const [deleteTarget, setDeleteTarget] = useState<CodeRecord | null>(null);
  const [deleteMode, setDeleteMode] = useState<DeleteMode>("code-only");
  const [isDeleting, setIsDeleting] = useState(false);
  const [deleteError, setDeleteError] = useState("");

  const deleteDialogRef = useRef<HTMLDialogElement>(null);
  const deleteInProgress = useRef(false);

  // 取得目前登入會員的程式碼紀錄
  useEffect(() => {
    if (userId === undefined) return;

    const controller = new AbortController();

    async function loadRecords() {
      setIsLoading(true);
      setError("");

      try {
        const response = await fetch("/api/records", {
          credentials: "include",
          cache: "no-store",
          signal: controller.signal,
        });

        if (response.status === 401) {
          throw new Error("登入已失效，請重新整理並登入。");
        }

        if (!response.ok) {
          throw new Error("無法取得程式碼紀錄，請稍後再試。");
        }

        const data = await response.json();

        if (!Array.isArray(data.records)) {
          throw new Error("程式碼紀錄的回傳格式不正確。");
        }

        setRecords(data.records);
      } catch (error) {
        if (controller.signal.aborted) return;

        setError(
          error instanceof Error
            ? error.message
            : "無法取得程式碼紀錄，請稍後再試。",
        );
      } finally {
        if (!controller.signal.aborted) {
          setIsLoading(false);
        }
      }
    }

    loadRecords();

    return () => controller.abort();
  }, [userId]);

  // 選擇要刪除的紀錄後，開啟確認視窗
  useEffect(() => {
    const dialog = deleteDialogRef.current;
    if (!dialog || !deleteTarget) return;

    dialog.showModal();

    const previousOverflow = document.body.style.overflow;
    document.body.style.overflow = "hidden";

    return () => {
      dialog.close();
      document.body.style.overflow = previousOverflow;
    };
  }, [deleteTarget]);

  function closeDeleteDialog() {
    if (deleteInProgress.current) return;

    setDeleteTarget(null);
    setDeleteError("");
  }

  async function performDelete(record: CodeRecord, mode: DeleteMode) {
    if (deleteInProgress.current) return;

    deleteInProgress.current = true;
    setIsDeleting(true);
    setDeleteError("");

    try {
      const response = await fetch(`/api/records/${record.id}?mode=${mode}`, {
        method: "DELETE",
        credentials: "include",
      });

      if (response.status === 401) {
        throw new Error("登入已失效，請重新整理並登入。");
      }

      if (!response.ok) {
        throw new Error("無法刪除程式碼紀錄，請稍後再試。");
      }

      if (mode === "all") {
        setRecords((previous) =>
          previous.filter((item) => item.id !== record.id),
        );
      } else {
        setRecords((previous) =>
          previous.map((item) =>
            item.id === record.id ? { ...item, code: null } : item,
          ),
        );
      }

      setDeleteTarget(null);
    } catch (error) {
      const message =
        error instanceof Error
          ? error.message
          : "無法刪除程式碼紀錄，請稍後再試。";

      if (record.code === null) {
        window.alert(message);
      } else {
        setDeleteError(message);
      }
    } finally {
      deleteInProgress.current = false;
      setIsDeleting(false);
    }
  }

  function handleDelete(record: CodeRecord) {
    if (deleteInProgress.current) return;

    setDeleteError("");

    // 程式碼已移除時，只需要確認是否完全刪除
    if (record.code === null) {
      const recordName =
        `#${record.record_number}` + (record.title ? ` ${record.title}` : "");

      const confirmed = window.confirm(
        `確定完全刪除「${recordName}」？\n保留的語法使用次數也會一併刪除，此操作無法復原。`,
      );

      if (confirmed) {
        void performDelete(record, "all");
      }

      return;
    }

    setDeleteMode("code-only");
    setDeleteTarget(record);
  }

  return (
    <>
      <h1 className="page-title">程式碼紀錄</h1>

      <p className="page-description">
        每個過程都值得紀錄，走過的足跡不會消失 :)
      </p>

      {isLoading ? (
        <p className={styles.message} role="status">
          正在載入程式碼紀錄…
        </p>
      ) : error ? (
        <p className={styles.error} role="alert">
          {error}
        </p>
      ) : records.length === 0 ? (
        <section className={styles.empty} aria-labelledby="records-empty-title">
          <div className={styles.icon} aria-hidden="true">
            {"{ }"}
          </div>

          <h2 id="records-empty-title">還沒有儲存的程式碼</h2>

          <p>從第一段程式碼開始，留下你的語法足跡。</p>

          <p>貼上程式碼、完成分析並儲存後，就能在這裡回顧與編輯。</p>

          <Link href="/" className={styles.startButton}>
            ＋ 開始分析程式碼
          </Link>
        </section>
      ) : (
        <div className={styles.recordList}>
          {records.map((record) => (
            <article className={styles.recordCard} key={record.id}>
              <div className={styles.recordHeader}>
                <h2 className={styles.recordTitle}>
                  #{record.record_number}
                  {record.title ? ` ${record.title}` : ""}
                </h2>

                <button
                  type="button"
                  className={styles.deleteButton}
                  disabled={isDeleting}
                  aria-label={`刪除紀錄 #${record.record_number}`}
                  onClick={() => handleDelete(record)}
                >
                  <svg
                    viewBox="0 0 24 24"
                    width="22"
                    height="22"
                    fill="none"
                    stroke="currentColor"
                    strokeWidth="1.5"
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    aria-hidden="true"
                  >
                    <path d="M3 6h18" />
                    <path d="M9 6V4h6v2" />
                    <path d="M5 6l1 14h12l1-14" />
                    <path d="M10 10v6M14 10v6" />
                  </svg>
                </button>
              </div>

              <p className={styles.recordMeta}>
                {record.language === "python"
                  ? "Python"
                  : record.language === "html"
                    ? "HTML"
                    : record.language}
                {" · "}
                {record.created_at.slice(0, 10).replaceAll("-", "/")}
                {" · "}
                {record.syntax_count} 種語法
              </p>

              {record.code === null ? (
                <p className={`${styles.codePreview} ${styles.deletedMessage}`}>
                  程式碼已移除，已保留語法使用次數紀錄。
                </p>
              ) : (
                <Link
                  href={`/?record=${record.id}`}
                  className={styles.recordEditLink}
                  aria-label={`編輯紀錄 #${record.record_number}`}
                  title="點擊編輯這份程式碼"
                >
                  <pre className={styles.codePreview}>
                    <code>{record.code}</code>
                  </pre>
                </Link>
              )}
            </article>
          ))}
        </div>
      )}
      <dialog
        ref={deleteDialogRef}
        className={styles.deleteDialog}
        aria-labelledby="delete-dialog-title"
        onCancel={(event) => {
          event.preventDefault();
          closeDeleteDialog();
        }}
      >
        {deleteTarget && (
          <>
            <button
              type="button"
              className={styles.closeButton}
              aria-label="關閉刪除確認視窗"
              disabled={isDeleting}
              onClick={closeDeleteDialog}
            >
              <span aria-hidden="true">×</span>
            </button>

            <h2 id="delete-dialog-title">刪除程式碼紀錄</h2>

            <p>
              #{deleteTarget.record_number}
              {deleteTarget.title ? ` ${deleteTarget.title}` : ""}
            </p>

            <p>請選擇刪除方式，此操作無法復原。</p>

            <fieldset className={styles.deleteOptions} disabled={isDeleting}>
              <legend>刪除方式</legend>

              <label className={styles.deleteOption}>
                <input
                  type="radio"
                  name="delete-mode"
                  value="code-only"
                  checked={deleteMode === "code-only"}
                  onChange={() => setDeleteMode("code-only")}
                />

                <span>
                  <strong>僅刪除程式碼、保留語法統計</strong>
                  <small>程式碼內容將移除，語法使用次數仍會保留。</small>
                </span>
              </label>

              <label className={styles.deleteOption}>
                <input
                  type="radio"
                  name="delete-mode"
                  value="all"
                  checked={deleteMode === "all"}
                  onChange={() => setDeleteMode("all")}
                />

                <span>
                  <strong>完全刪除</strong>
                  <small>移除程式碼及這份練習的語法統計。</small>
                </span>
              </label>
            </fieldset>

            {deleteError && (
              <p className={styles.deleteError} role="alert">
                {deleteError}
              </p>
            )}

            <div className={styles.deleteActions}>
              <button
                type="button"
                disabled={isDeleting}
                onClick={closeDeleteDialog}
              >
                取消
              </button>

              <button
                type="button"
                className={styles.confirmDelete}
                disabled={isDeleting}
                onClick={() => {
                  void performDelete(deleteTarget, deleteMode);
                }}
              >
                {isDeleting ? "刪除中…" : "確認刪除"}
              </button>
            </div>
          </>
        )}
      </dialog>
    </>
  );
}
