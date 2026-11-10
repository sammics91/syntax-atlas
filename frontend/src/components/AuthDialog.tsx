"use client";

import { useEffect, useRef, useState } from "react";
import type { FormEvent } from "react";
import styles from "./AuthDialog.module.css";

export type AuthUser = {
  id: number;
  name: string;
  email: string;
};

type AuthDialogProps = {
  onClose: () => void;
  onSignedIn: (user: AuthUser) => void;
  notice?: string;
};

export default function AuthDialog({
  onClose,
  onSignedIn,
  notice = "",
}: AuthDialogProps) {
  const dialogRef = useRef<HTMLDialogElement>(null);
  const [mode, setMode] = useState<"signin" | "signup" | "forgot">("signin");
  const [error, setError] = useState("");
  const [message, setMessage] = useState(notice);
  const [isSubmitting, setIsSubmitting] = useState(false);

  const isSignup = mode === "signup";
  const isForgotPassword = mode === "forgot";

  // 開啟登入視窗時禁止背景捲動，關閉後恢復捲動
  useEffect(() => {
    const dialog = dialogRef.current;
    if (!dialog) return;

    const previousOverflow = document.body.style.overflow;

    dialog.showModal();
    document.body.style.overflow = "hidden";

    return () => {
      document.body.style.overflow = previousOverflow;
      dialog.close();
    };
  }, []);

  function switchMode() {
    setMode(isSignup ? "signin" : "signup");
    setError("");
    setMessage("");
  }

  // 申請密碼重設，後端不會透露 Email 是否已註冊
  async function handleForgotPassword(email: string) {
    setIsSubmitting(true);

    try {
      const response = await fetch("/api/forgot-password", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ email }),
      });

      if (!response.ok) {
        setError(
          response.status === 422
            ? "請輸入有效的 Email。"
            : "服務暫時無法完成請求，請稍後再試。",
        );
        return;
      }

      const data = await response.json();

      setMessage(
        typeof data.message === "string"
          ? data.message
          : "若此 Email 已註冊，將收到重設連結。",
      );
    } catch {
      setError("無法連線至服務，請確認後端已啟動。");
    } finally {
      setIsSubmitting(false);
    }
  }

  async function handleSubmit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();

    if (isSubmitting) return;

    setError("");
    setMessage("");

    const form = event.currentTarget;
    const formData = new FormData(form);

    const name = String(formData.get("name") ?? "").trim();
    const email = String(formData.get("email") ?? "").trim();

    if (isForgotPassword) {
      await handleForgotPassword(email);
      return;
    }

    const password = String(formData.get("password") ?? "");

    if (isSignup && !name) {
      setError("請輸入暱稱。");
      return;
    }

    const submittedMode = mode;
    const payload = isSignup ? { name, email, password } : { email, password };

    setIsSubmitting(true);

    try {
      const response = await fetch(`/api/${submittedMode}`, {
        method: "POST",
        credentials: "include",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(payload),
      });

      if (!response.ok) {
        if (response.status === 409) {
          setError("此 Email 已被註冊。");
        } else if (response.status === 401) {
          setError("Email 或密碼錯誤。");
        } else if (response.status === 422) {
          setError("請確認暱稱、Email 與密碼符合格式及長度限制。");
        } else {
          setError("服務暫時無法完成請求，請稍後再試。");
        }

        return;
      }

      if (submittedMode === "signup") {
        form.reset();
        setMode("signin");
        setMessage("註冊成功！請使用剛才的帳號登入。");
      } else {
        const user: AuthUser = await response.json();

        form.reset();
        onSignedIn(user);
        onClose();
      }
    } catch {
      setError("無法連線至服務，請確認後端已啟動。");
    } finally {
      setIsSubmitting(false);
    }
  }

  return (
    <dialog
      ref={dialogRef}
      className={styles.dialog}
      aria-labelledby="auth-title"
      onCancel={(event) => {
        event.preventDefault();

        if (!isSubmitting) {
          onClose();
        }
      }}
    >
      <div className={styles.panel}>
        <button
          type="button"
          className={styles.closeButton}
          aria-label="關閉登入與註冊視窗"
          onClick={onClose}
          disabled={isSubmitting}
        >
          <span aria-hidden="true">×</span>
        </button>

        <h2 id="auth-title" className={styles.title}>
          {isForgotPassword
            ? "忘記密碼"
            : isSignup
              ? "建立你的語法辭典"
              : "登入，接著累積"}
        </h2>

        {error ? (
          <p className={styles.error} role="alert">
            {error}
          </p>
        ) : (
          <p className={styles.description}>
            {isForgotPassword
              ? "輸入註冊 Email，以取得重設連結。"
              : "將語法收藏與練習紀錄保存在自己的帳號。"}
          </p>
        )}

        <form key={mode} className={styles.form} onSubmit={handleSubmit}>
          {isSignup && (
            <div className={styles.field}>
              <label htmlFor="auth-name">暱稱</label>
              <input
                id="auth-name"
                name="name"
                type="text"
                placeholder="你的暱稱"
                autoComplete="nickname"
                maxLength={14}
                disabled={isSubmitting}
                required
              />
            </div>
          )}

          <div className={styles.field}>
            <label htmlFor="auth-email">Email</label>
            <input
              id="auth-email"
              name="email"
              type="email"
              placeholder="you@example.com"
              autoComplete="email"
              maxLength={254}
              disabled={isSubmitting}
              required
            />
          </div>

          {!isForgotPassword && (
            <div className={styles.field}>
              <label htmlFor="auth-password">密碼</label>

              <input
                id="auth-password"
                name="password"
                type="password"
                placeholder="輸入 8～19 個字元"
                autoComplete={isSignup ? "new-password" : "current-password"}
                minLength={8}
                maxLength={19}
                disabled={isSubmitting}
                required
              />
            </div>
          )}

          <button
            type="submit"
            className={styles.submitButton}
            disabled={isSubmitting}
          >
            {isSubmitting
              ? isForgotPassword
                ? "送出中…"
                : "處理中…"
              : isForgotPassword
                ? "寄送重設連結"
                : isSignup
                  ? "建立帳號"
                  : "登入"}
          </button>
        </form>

        {message && (
          <p className={styles.message} role="status">
            {message}
          </p>
        )}

        <div className={styles.links}>
          {mode === "signin" ? (
            <>
              <button
                type="button"
                className={styles.textButton}
                onClick={switchMode}
                disabled={isSubmitting}
              >
                註冊
              </button>

              <span aria-hidden="true">/</span>

              <button
                type="button"
                className={styles.textButton}
                disabled={isSubmitting}
                onClick={() => {
                  setMode("forgot");
                  setError("");
                  setMessage("");
                }}
              >
                忘記密碼
              </button>
            </>
          ) : (
            <button
              type="button"
              className={styles.textButton}
              disabled={isSubmitting}
              onClick={() => {
                setMode("signin");
                setError("");
                setMessage("");
              }}
            >
              {isForgotPassword ? "返回登入" : "已有帳號？登入"}
            </button>
          )}
        </div>
      </div>
    </dialog>
  );
}
