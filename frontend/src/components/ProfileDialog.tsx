"use client";

import { useEffect, useRef, useState, type FormEvent } from "react";

import type { AuthUser } from "./AuthDialog";
import authStyles from "./AuthDialog.module.css";
import styles from "./ProfileDialog.module.css";

// 會員資訊 API 回傳格式
type Profile = {
  id: number;
  name: string;
  email: string;
  created_at: string;
};

type ProfileDialogProps = {
  open: boolean;
  onClose: () => void;
  onUserUpdated: (user: AuthUser) => void;
  onPasswordChanged: () => void;
  onAccountDeleted: () => void;
};

export default function ProfileDialog({
  open,
  onClose,
  onUserUpdated,
  onPasswordChanged,
  onAccountDeleted,
}: ProfileDialogProps) {
  const dialogRef = useRef<HTMLDialogElement>(null);

  const [profile, setProfile] = useState<Profile | null>(null);
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState("");

  // 會員資訊、修改密碼與刪除帳號三種畫面。
  const [view, setView] = useState<"profile" | "password" | "delete">(
    "profile",
  );

  const [isSavingPassword, setIsSavingPassword] = useState(false);
  const passwordSavingRef = useRef(false);

  // 暱稱編輯內容與儲存狀態。
  const [name, setName] = useState("");
  const [isSavingName, setIsSavingName] = useState(false);
  const nameSavingRef = useRef(false);
  const [message, setMessage] = useState("");

  // 忽略頭尾空白；與原本不同時才需要儲存。
  const hasNameChanges = profile !== null && name.trim() !== profile.name;

  // 刪除帳號期間，避免重複送出或關閉視窗。
  const [isDeletingAccount, setIsDeletingAccount] = useState(false);
  const accountDeletingRef = useRef(false);

  // 同步原生視窗開關，開啟時暫停背景捲動。
  useEffect(() => {
    const dialog = dialogRef.current;
    if (!dialog) return;

    if (!open) {
      if (dialog.open) dialog.close();
      return;
    }

    if (!dialog.open) dialog.showModal();

    const previousOverflow = document.body.style.overflow;
    document.body.style.overflow = "hidden";

    return () => {
      document.body.style.overflow = previousOverflow;
    };
  }, [open]);

  // 每次開啟時，重新讀取自己的會員資訊。
  useEffect(() => {
    if (!open) return;

    const controller = new AbortController();

    async function loadProfile() {
      // 每次重新開啟，先顯示會員資訊。
      setView("profile");
      setProfile(null);
      setIsLoading(true);
      setError("");
      setName("");
      setMessage("");

      try {
        const response = await fetch("/api/profile", {
          credentials: "include",
          cache: "no-store",
          signal: controller.signal,
        });

        if (!response.ok) {
          throw new Error(
            response.status === 401
              ? "登入已失效，請重新登入。"
              : `讀取會員資訊失敗（${response.status}）。`,
          );
        }

        const data: Profile = await response.json();

        if (!controller.signal.aborted) {
          setProfile(data);
          setName(data.name);
        }
      } catch (error) {
        if (controller.signal.aborted) return;

        setError(
          error instanceof Error
            ? error.message
            : "無法連線至會員服務，請稍後再試。",
        );
      } finally {
        if (!controller.signal.aborted) {
          setIsLoading(false);
        }
      }
    }

    void loadProfile();

    return () => controller.abort();
  }, [open]);

  // 儲存暱稱，成功後同步更新會員資訊與導覽列。
  async function handleSaveName(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();

    if (!profile || !hasNameChanges || !name.trim() || nameSavingRef.current) {
      return;
    }

    const submittedName = name.trim();

    nameSavingRef.current = true;
    setIsSavingName(true);
    setError("");
    setMessage("");

    try {
      const response = await fetch("/api/profile/name", {
        method: "PUT",
        credentials: "include",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          name: submittedName,
        }),
      });

      if (!response.ok) {
        throw new Error(
          response.status === 401
            ? "登入已失效，請重新登入。"
            : response.status === 422
              ? "暱稱須為 1～14 個字元，不能只有空白。"
              : `修改暱稱失敗（${response.status}），請稍後再試。`,
        );
      }

      const updatedUser: AuthUser = await response.json();

      setProfile((current) =>
        current ? { ...current, name: updatedUser.name } : current,
      );

      setName(updatedUser.name);
      onUserUpdated(updatedUser);
      setMessage("暱稱已更新。");
    } catch (error) {
      setError(
        error instanceof Error
          ? error.message
          : "無法連線至會員服務，請稍後再試。",
      );
    } finally {
      nameSavingRef.current = false;
      setIsSavingName(false);
    }
  }

  // 修改密碼；密碼只在本次請求使用，不存入瀏覽器暫存。
  async function handleSavePassword(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();

    if (passwordSavingRef.current) return;

    const form = event.currentTarget;
    const formData = new FormData(form);

    const currentPassword = String(formData.get("current_password") ?? "");
    const newPassword = String(formData.get("new_password") ?? "");
    const confirmPassword = String(formData.get("confirm_password") ?? "");

    setError("");
    setMessage("");

    if (
      [currentPassword, newPassword, confirmPassword].some(
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

    if (newPassword === currentPassword) {
      setError("新密碼不能與目前密碼相同。");
      return;
    }

    passwordSavingRef.current = true;
    setIsSavingPassword(true);

    try {
      const response = await fetch("/api/profile/password", {
        method: "PUT",
        credentials: "include",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          current_password: currentPassword,
          new_password: newPassword,
          confirm_password: confirmPassword,
        }),
      });

      if (!response.ok) {
        const data = await response.json().catch(() => null);

        throw new Error(
          typeof data?.detail === "string"
            ? data.detail
            : `修改密碼失敗（${response.status}），請稍後再試。`,
        );
      }

      // 成功後清除欄位，再通知外層清除登入狀態。
      form.reset();
      onPasswordChanged();
    } catch (error) {
      setError(
        error instanceof Error
          ? error.message
          : "無法連線至會員服務，請稍後再試。",
      );
    } finally {
      passwordSavingRef.current = false;
      setIsSavingPassword(false);
    }
  }

  // 驗證輸入密碼後，刪除自己的帳號。
  async function handleDeleteAccount(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();

    if (accountDeletingRef.current) return;

    const form = event.currentTarget;
    const formData = new FormData(form);
    const password = String(formData.get("password") ?? "");

    setError("");
    setMessage("");

    if (password.length < 8 || password.length > 19) {
      setError("密碼須為 8～19 個字元。");
      return;
    }

    accountDeletingRef.current = true;
    setIsDeletingAccount(true);

    try {
      const response = await fetch("/api/profile", {
        method: "DELETE",
        credentials: "include",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ password }),
      });

      if (!response.ok) {
        const data = await response.json().catch(() => null);

        throw new Error(
          typeof data?.detail === "string"
            ? data.detail
            : `刪除帳號失敗（${response.status}），請稍後再試。`,
        );
      }

      // 後端確認成功後，清除密碼並通知外層返回首頁。
      form.reset();
      onAccountDeleted();
    } catch (error) {
      setError(
        error instanceof Error
          ? error.message
          : "無法確認刪除結果，請重新整理確認帳號狀態。",
      );
    } finally {
      accountDeletingRef.current = false;
      setIsDeletingAccount(false);
    }
  }

  return (
    <dialog
      ref={dialogRef}
      className={authStyles.dialog}
      aria-labelledby="profile-title"
      onCancel={(event) => {
        event.preventDefault();

        if (
          !nameSavingRef.current &&
          !passwordSavingRef.current &&
          !accountDeletingRef.current
        ) {
          onClose();
        }
      }}
      onClose={onClose}
    >
      <div className={authStyles.panel}>
        <button
          type="button"
          className={authStyles.closeButton}
          aria-label="關閉會員資訊"
          onClick={onClose}
          disabled={isSavingName || isSavingPassword || isDeletingAccount}
        >
          ×
        </button>

        <h2 id="profile-title" className={authStyles.title}>
          {view === "profile"
            ? "會員資訊"
            : view === "password"
              ? "修改密碼"
              : "刪除帳號"}
        </h2>

        {isLoading && (
          <p className={styles.notice} role="status">
            正在讀取會員資訊…
          </p>
        )}

        {error && (
          <p className={styles.error} role="alert">
            {error}
          </p>
        )}

        {profile && view === "profile" && (
          <form className={styles.profileForm} onSubmit={handleSaveName}>
            <div className={styles.field}>
              <label htmlFor="profile-name">暱稱：</label>

              {/* 未聚焦時像文字，聚焦後顯示輸入框 */}
              <input
                id="profile-name"
                name="name"
                className={styles.nameInput}
                type="text"
                value={name}
                maxLength={14}
                autoComplete="nickname"
                disabled={isSavingName}
                onChange={(event) => {
                  setName(event.target.value);
                  setError("");
                  setMessage("");
                }}
              />
            </div>

            <div className={styles.field}>
              <span>Email：</span>

              {/* Email 只顯示文字，不提供編輯 */}
              <span className={styles.emailValue}>{profile.email}</span>
            </div>

            {/* 會員註冊日期 */}
            <div className={styles.field}>
              <span className={styles.registeredLabel}>註冊日期：</span>

              <span className={styles.registeredAt}>
                {profile.created_at.slice(0, 10).replaceAll("-", "/")}
              </span>
            </div>

            {message && (
              <p className={styles.message} role="status">
                {message}
              </p>
            )}

            {/* 暱稱有變更時儲存；沒有變更時開啟修改密碼 */}
            <button
              type={hasNameChanges ? "submit" : "button"}
              className={`${authStyles.submitButton} ${styles.mainButton}`}
              disabled={isSavingName || (hasNameChanges && !name.trim())}
              onClick={() => {
                if (!hasNameChanges) {
                  setError("");
                  setMessage("");
                  setView("password");
                }
              }}
            >
              {isSavingName
                ? "儲存中…"
                : hasNameChanges
                  ? "儲存暱稱"
                  : "修改密碼"}
            </button>
          </form>
        )}

        {/* 修改密碼畫面 */}
        {profile && view === "password" && (
          <form className={styles.profileForm} onSubmit={handleSavePassword}>
            <div className={`${authStyles.field} ${styles.passwordField}`}>
              <label htmlFor="current-password">目前密碼</label>
              <input
                id="current-password"
                name="current_password"
                type="password"
                autoComplete="current-password"
                placeholder="輸入目前密碼"
                minLength={8}
                maxLength={19}
                disabled={isSavingPassword}
                required
              />
            </div>

            <div className={`${authStyles.field} ${styles.passwordField}`}>
              <label htmlFor="new-password">新密碼</label>
              <input
                id="new-password"
                name="new_password"
                type="password"
                autoComplete="new-password"
                placeholder="輸入 8～19 個字元"
                minLength={8}
                maxLength={19}
                disabled={isSavingPassword}
                required
              />
            </div>

            <div className={`${authStyles.field} ${styles.passwordField}`}>
              <label htmlFor="confirm-password">確認新密碼</label>
              <input
                id="confirm-password"
                name="confirm_password"
                type="password"
                autoComplete="new-password"
                placeholder="再次輸入新密碼"
                minLength={8}
                maxLength={19}
                disabled={isSavingPassword}
                required
              />
            </div>

            <button
              type="submit"
              className={`${authStyles.submitButton} ${styles.mainButton}`}
              disabled={isSavingPassword}
            >
              {isSavingPassword ? "修改中…" : "確認修改密碼"}
            </button>
          </form>
        )}

        {/* 刪除帳號確認畫面 */}
        {profile && view === "delete" && (
          <form className={styles.profileForm} onSubmit={handleDeleteAccount}>
            <p className={styles.deleteDescription}>
              刪除後，程式碼紀錄、語法使用次數與收藏都會永久移除， 無法復原。
            </p>

            <div className={`${authStyles.field} ${styles.passwordField}`}>
              <label htmlFor="delete-password">輸入密碼</label>

              <input
                id="delete-password"
                name="password"
                type="password"
                autoComplete="current-password"
                placeholder="輸入目前使用的密碼"
                minLength={8}
                maxLength={19}
                disabled={isDeletingAccount}
                required
              />
            </div>

            <button
              type="submit"
              className={`${authStyles.submitButton} ${styles.deleteSubmit}`}
              disabled={isDeletingAccount}
            >
              {isDeletingAccount ? "刪除中…" : "確認刪除帳號"}
            </button>
          </form>
        )}

        {/* 表單外的底部連結 */}
        {profile && (
          <div className={styles.bottomLinks}>
            <button
              type="button"
              className={`${styles.textButton} ${
                view === "profile" ? styles.deleteButton : ""
              }`}
              disabled={isSavingName || isSavingPassword || isDeletingAccount}
              onClick={() => {
                setError("");
                setMessage("");
                setView(view === "profile" ? "delete" : "profile");
              }}
            >
              {view === "profile" ? "刪除帳號" : "返回會員資訊"}
            </button>
          </div>
        )}
      </div>
    </dialog>
  );
}
