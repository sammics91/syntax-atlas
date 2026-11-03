import type { Metadata } from "next";
import type { ReactNode } from "react";
import SiteShell from "@/components/SiteShell";
import "./globals.css";

export const metadata: Metadata = {
  title: "Syntax Atlas",
  description:
    "提供程式碼分析、語法快速查閱、個人分析紀錄與語法使用統計。",
};

export default function RootLayout({
  children,
}: {
  children: ReactNode;
}) {
  return (
    <html lang="zh-Hant">
      <body>
        <SiteShell>{children}</SiteShell>
      </body>
    </html>
  );
}