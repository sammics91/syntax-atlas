"use client";

// React
import { useEffect, useLayoutEffect, useState, type ReactNode } from "react";

// Next.js
import Image from "next/image";
import Link from "next/link";
import { usePathname } from "next/navigation";

// 自訂元件與型別
import AuthDialog from "./AuthDialog";
import type { AuthUser } from "./AuthDialog";

const navigation = [
  { href: "/", label: "分析程式碼", prefix: "＋" },
  { href: "/dictionary", label: "語法辭典" },
  { href: "/statistics", label: "常用語法" },
  { href: "/records", label: "程式碼紀錄" },
];

export default function SiteShell({ children }: { children: ReactNode }) {
  const pathname = usePathname();

  // 目前會員與登入狀態
  const [user, setUser] = useState<AuthUser | null>(null);
  const [isAuthLoading, setIsAuthLoading] = useState(true);
  const [authError, setAuthError] = useState("");

  // 登入視窗與登出操作
  const [isAuthOpen, setIsAuthOpen] = useState(false);
  const [isSigningOut, setIsSigningOut] = useState(false);

  useLayoutEffect(() => {
    function updateScrollbarWidth() {
      // 建立看不見的測量元素，不占用頁面排版空間
      const probe = document.createElement("div");

      probe.style.cssText = `
        position: fixed;
        top: -9999px;
        width: 100px;
        height: 100px;
        overflow: scroll;
        visibility: hidden;
        border: 0;
        padding: 0;
        `;

      document.body.appendChild(probe);

      const scrollbarWidth = probe.offsetWidth - probe.clientWidth;

      probe.remove();

      document.documentElement.style.setProperty(
        "--scrollbar-width",
        `${scrollbarWidth}px`,
      );
    }

    updateScrollbarWidth();

    window.addEventListener("resize", updateScrollbarWidth);

    return () => {
      window.removeEventListener("resize", updateScrollbarWidth);
      document.documentElement.style.removeProperty("--scrollbar-width");
    };
  }, []);

  // 重新整理網頁時，透過 Cookie 確認登入狀態
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
          }
          return;
        }

        if (!response.ok) {
          throw new Error("查詢登入狀態失敗");
        }

        const currentUser: AuthUser = await response.json();

        if (!controller.signal.aborted) {
          setUser(currentUser);
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

  // 登出
  async function handleSignout() {
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
    <div className="site-shell">
      <header className="site-header">
        <div className="header-inner">
          <div className="site-heading">
            <Link href="/" className="site-brand">
              <span className="brand-symbol">{"{ }"}</span>
              Syntax Atlas
            </Link>

            <span className="site-tagline">/ 我的語法足跡</span>
          </div>

          <div className="site-account">
            <span
              className={`account-name${authError ? " account-name-error" : ""}`}
              title={authError || undefined}
            >
              {isAuthLoading
                ? "確認中…"
                : user
                  ? user.name
                  : authError
                    ? "狀態未確認"
                    : "訪客"}
            </span>

            {user ? (
              <button
                type="button"
                className="login-button"
                onClick={handleSignout}
                disabled={isSigningOut}
              >
                <span className="account-label-desktop">
                  {isSigningOut ? "登出中…" : "登出"}
                </span>

                <span className="account-label-mobile">
                  {isSigningOut ? "登出中…" : `${user.name} · 登出`}
                </span>
              </button>
            ) : (
              <button
                type="button"
                className="login-button"
                disabled={isAuthLoading || Boolean(authError)}
                onClick={() => setIsAuthOpen(true)}
              >
                <span className="account-label-desktop">登入／註冊</span>
                <span className="account-label-mobile">登入</span>
              </button>
            )}
          </div>
        </div>

        {isAuthOpen && (
          <AuthDialog
            onClose={() => setIsAuthOpen(false)}
            onSignedIn={(currentUser) => {
              setUser(currentUser);
              setAuthError("");
            }}
          />
        )}
      </header>

      <div className="site-body">
        <aside className="site-sidebar">
          <nav className="sidebar-nav" aria-label="主要選單">
            {navigation.map((item) => {
              const isActive = pathname === item.href;

              return (
                <Link
                  key={item.href}
                  href={item.href}
                  className={`sidebar-link${isActive ? " is-active" : ""}`}
                  aria-current={isActive ? "page" : undefined}
                >
                  <span className="sidebar-prefix" aria-hidden="true">
                    {item.prefix}
                  </span>
                  {item.label}
                </Link>
              );
            })}
          </nav>
        </aside>

        <main className="page-content">{children}</main>
      </div>

      <footer className="site-footer">
        <div className="footer-inner">
          <div className="footer-info">
            <small>© 2026 Syntax Atlas · 陳珈樺</small>

            <a
              href="https://github.com/sammics91/syntax-atlas"
              target="_blank"
              rel="noopener noreferrer"
              className="github-link"
              aria-label="在新分頁開啟 Syntax Atlas GitHub 儲存庫"
            >
              <Image src="/icons/github.png" alt="" width={20} height={20} />
            </a>
          </div>
        </div>
      </footer>
    </div>
  );
}
