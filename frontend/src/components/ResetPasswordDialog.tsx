"use client";

import { useEffect, useRef, useState } from "react";
import type { FormEvent } from "react";

import authStyles from "./AuthDialog.module.css";
import styles from "./ResetPasswordDialog.module.css";

type ResetPasswordDialogProps = {
  token: string;
  onClose: () => void;
};

export default function ResetPasswordDialog({
  token,
  onClose,
}: ResetPasswordDialogProps) {
  const dialogRef = useRef<HTMLDialogElement>(null);
  const submittingRef = useRef(false);

  const [isSubmitting, setIsSubmitting] = useState(false);
  const [error, setError] = useState("");

  // 只檢查格式；效期與使用狀態仍由後端驗證。
  const hasValidFormat = /^[A-Za-z0-9_-]{43}$/.test(token);

  // 元件出現時開啟視窗，並暫停背景捲動。
  useEffect(() => {
    const dialog = dialogRef.current;
    if (!dialog) return;

    if (!dialog.open) dialog.showModal();

    const previousOverflow = document.body.style.overflow;
    document.body.style.overflow = "hidden";

    return () => {
      document.body.style.overflow = previousOverflow;
      dialog.close();
    };
  }, []);

  async function handleSubmit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();

    if (!hasValidFormat || submittingRef.current) return;

    const form = event.currentTarget;
    const formData = new FormData(form);

    const newPassword = String(formData.get("new_password") ?? "");

    const confirmPassword = String(formData.get("confirm_password") ?? "");

    setError("");

    if (
      [newPassword, confirmPassword].some(
        (value) => value.length < 8 || value.length > 19,
      )
    ) {
      setError("密碼須為 8～19 個字元。");
      return;
    }

    if (newPassword !== confirmPassword) {
      setError("兩次輸入的新密碼不一致。");
      return;
    }

    submittingRef.current = true;
    setIsSubmitting(true);

    let isRedirecting = false;

    try {
      const response = await fetch("/api/reset-password", {
        method: "POST",
        credentials: "include",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          token,
          new_password: newPassword,
          confirm_password: confirmPassword,
        }),
      });

      if (!response.ok) {
        const data = await response.json().catch(() => null);

        throw new Error(
          typeof data?.detail === "string"
            ? data.detail
            : `重設密碼失敗（${response.status}），請稍後再試。`,
        );
      }

      // 成功後清除密碼，重新載入首頁並開啟登入視窗。
      form.reset();
      isRedirecting = true;

      window.location.replace("/?password-reset=success");
    } catch (error) {
      setError(
        error instanceof Error
          ? error.message
          : "無法確認重設結果，請嘗試以新密碼登入，或重新申請重設。",
      );
    } finally {
      if (!isRedirecting) {
        submittingRef.current = false;
        setIsSubmitting(false);
      }
    }
  }

  const displayError = !hasValidFormat
    ? "重設連結不完整，請從郵件開啟完整連結。"
    : error;

  return (
    <dialog
      ref={dialogRef}
      className={authStyles.dialog}
      aria-labelledby="reset-password-title"
      onCancel={(event) => {
        event.preventDefault();

        if (!submittingRef.current) {
          onClose();
        }
      }}
    >
      <div className={authStyles.panel}>
        <button
          type="button"
          className={authStyles.closeButton}
          aria-label="關閉重設密碼視窗"
          disabled={isSubmitting}
          onClick={onClose}
        >
          ×
        </button>

        <h2 id="reset-password-title" className={authStyles.title}>
          重設密碼
        </h2>

        {displayError ? (
          <p className={authStyles.error} role="alert">
            {displayError}
          </p>
        ) : (
          <p className={authStyles.description}>
            請設定新密碼，完成後重新登入。
          </p>
        )}

        {hasValidFormat && (
          <form
            className={`${authStyles.form} ${styles.form}`}
            onSubmit={handleSubmit}
          >
            <div className={`${authStyles.field} ${styles.field}`}>
              <label htmlFor="reset-new-password">新密碼</label>

              <input
                id="reset-new-password"
                name="new_password"
                type="password"
                autoComplete="new-password"
                placeholder="輸入 8～19 個字元"
                minLength={8}
                maxLength={19}
                disabled={isSubmitting}
                required
              />
            </div>

            <div className={`${authStyles.field} ${styles.field}`}>
              <label htmlFor="reset-confirm-password">確認新密碼</label>

              <input
                id="reset-confirm-password"
                name="confirm_password"
                type="password"
                autoComplete="new-password"
                placeholder="再次輸入新密碼"
                minLength={8}
                maxLength={19}
                disabled={isSubmitting}
                required
              />
            </div>

            <button
              type="submit"
              className={authStyles.submitButton}
              disabled={isSubmitting}
            >
              {isSubmitting ? "儲存中…" : "確認重設密碼"}
            </button>
          </form>
        )}

        <div className={authStyles.links}>
          <button
            type="button"
            className={authStyles.textButton}
            disabled={isSubmitting}
            onClick={onClose}
          >
            返回首頁
          </button>
        </div>
      </div>
    </dialog>
  );
}
