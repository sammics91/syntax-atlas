// React
import type { ReactNode } from "react";
// Next.js
import type { Metadata } from "next";
// 自訂元件
import AuthProvider from "@/components/AuthProvider";
import SiteShell from "@/components/SiteShell";
//樣式
import "./globals.css";

export const metadata: Metadata = {
  title: "Syntax Atlas",
  description: "提供程式碼分析、語法快速查閱、個人分析紀錄與語法使用統計。",
};

export default function RootLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="zh-Hant">
      <body>
        <AuthProvider>
          <SiteShell>{children}</SiteShell>
        </AuthProvider>
      </body>
    </html>
  );
}
