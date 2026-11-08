"use client";

import { createContext, useContext, useEffect, useState } from "react";
import type { ReactNode } from "react";
import type { AuthUser } from "./AuthDialog";

type AuthState = {
  user: AuthUser | null;
  isAuthLoading: boolean;
  isSigningOut: boolean;
  authError: string;
  completeSignin: (user: AuthUser) => void;
  signout: () => Promise<void>;
};

const AuthContext = createContext<AuthState | undefined>(undefined);

export default function AuthProvider({ children }: { children: ReactNode }) {
  const [user, setUser] = useState<AuthUser | null>(null);
  const [isAuthLoading, setIsAuthLoading] = useState(true);
  const [isSigningOut, setIsSigningOut] = useState(false);
  const [authError, setAuthError] = useState("");

  // 開啟網站時，透過 Cookie 確認登入狀態
  useEffect(() => {
    const controller = new AbortController();

    async function loadCurrentUser() {
      try {
        const response = await fetch("/api/auth", {
          credentials: "include",
          cache: "no-store",
          signal: controller.signal,
        });

        if (response.status === 401) {
          if (!controller.signal.aborted) {
            setUser(null);
            setAuthError("");
          }
          return;
        }

        if (!response.ok) {
          throw new Error("查詢登入狀態失敗");
        }

        const currentUser: AuthUser = await response.json();

        if (!controller.signal.aborted) {
          setUser(currentUser);
          setAuthError("");
        }
      } catch {
        if (!controller.signal.aborted) {
          setAuthError("無法確認登入狀態，請重新整理再試。");
        }
      } finally {
        if (!controller.signal.aborted) {
          setIsAuthLoading(false);
        }
      }
    }

    loadCurrentUser();

    return () => controller.abort();
  }, []);

  // 登入成功後，更新各頁面共用的會員資料
  function completeSignin(currentUser: AuthUser) {
    setUser(currentUser);
    setAuthError("");
  }

  // 後端成功登出後，才清除前端會員狀態
  async function signout() {
    if (isSigningOut) return;

    setIsSigningOut(true);
    setAuthError("");

    try {
      const response = await fetch("/api/signout", {
        method: "POST",
        credentials: "include",
      });

      if (!response.ok) {
        throw new Error("登出失敗");
      }

      setUser(null);
    } catch {
      setAuthError("登出失敗，請稍後再試。");
    } finally {
      setIsSigningOut(false);
    }
  }

  return (
    <AuthContext.Provider
      value={{
        user,
        isAuthLoading,
        isSigningOut,
        authError,
        completeSignin,
        signout,
      }}
    >
      {children}
    </AuthContext.Provider>
  );
}

// 各元件透過 useAuth 取得共用會員狀態
export function useAuth() {
  const context = useContext(AuthContext);

  if (context === undefined) {
    throw new Error("useAuth 必須在 AuthProvider 裡使用");
  }

  return context;
}
