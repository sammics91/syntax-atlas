"use client";

// React
import {
  useEffect,
  useLayoutEffect,
  useRef,
  useState,
  type ReactNode,
} from "react";

// Next.js
import Image from "next/image";
import Link from "next/link";
import { usePathname, useRouter } from "next/navigation";

// 自訂元件與型別
import AuthDialog from "./AuthDialog";
import { useAuth } from "./AuthProvider";

const navigation = [
  { href: "/", label: "分析程式碼", prefix: "＋" },
  { href: "/dictionary", label: "語法辭典" },
  { href: "/statistics", label: "常用語法" },
  { href: "/records", label: "程式碼紀錄" },
];

export default function SiteShell({ children }: { children: ReactNode }) {
  const pathname = usePathname();
  const router = useRouter();

  // 從 AuthProvider 取得共用會員狀態
  const {
    user,
    isAuthLoading,
    isSigningOut,
    authError,
    completeSignin,
    signout,
  } = useAuth();

  // 登入視窗控制
  const [isAuthOpen, setIsAuthOpen] = useState(false);

  // 避免同一次進入重複跳出警告
  const warnedPath = useRef<string | null>(null);

  // 判斷目前頁面是否需要登入
  const requiresLogin =
    pathname === "/records" || pathname.startsWith("/records/");

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

  // 訪客進入紀錄頁時，提示登入並返回首頁
  useEffect(() => {
    if (!requiresLogin || user) {
      warnedPath.current = null;
      return;
    }

    // 等身分確認完成；連線失敗時不要誤判成訪客
    if (isAuthLoading || authError) return;

    if (warnedPath.current === pathname) return;
    warnedPath.current = pathname;

    window.alert("請先登入，才能查看常用語法與程式碼紀錄。");

    // alert 會等使用者按確定後，才繼續執行
    router.replace("/");
    setIsAuthOpen(true);
  }, [requiresLogin, user, isAuthLoading, authError, pathname, router]);

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
                onClick={signout}
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
            onSignedIn={completeSignin}
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

        <main className="page-content">
          {requiresLogin && isAuthLoading ? (
            <p role="status">正在確認登入狀態…</p>
          ) : requiresLogin && !user ? (
            authError ? (
              <p role="alert">{authError}</p>
            ) : null
          ) : (
            children
          )}
        </main>
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
