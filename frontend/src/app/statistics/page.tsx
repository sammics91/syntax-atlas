"use client";

import { useEffect, useState } from "react";
import Link from "next/link";

import { useAuth } from "@/components/AuthProvider";

import styles from "./page.module.css";

type SyntaxUsage = {
  id: number;
  name: string;
  count: number;
};

type StatisticsResult = {
  language: string;
  record_count: number;
  usages: SyntaxUsage[];
};

export default function StatisticsPage() {
  const { user } = useAuth();

  const [statistics, setStatistics] = useState<StatisticsResult | null>(null);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState("");

  // 取得目前會員累積的語法使用次數
  useEffect(() => {
    if (!user) return;

    const controller = new AbortController();

    async function loadStatistics() {
      setIsLoading(true);
      setError("");

      try {
        const response = await fetch("/api/statistics", {
          credentials: "include",
          cache: "no-store",
          signal: controller.signal,
        });

        if (!response.ok) {
          throw new Error(
            response.status === 401
              ? "登入已失效，請重新整理並登入。"
              : "無法取得常用語法統計，請稍後再試。",
          );
        }

        const data = await response.json();

        if (
          !data ||
          typeof data.record_count !== "number" ||
          !Array.isArray(data.usages)
        ) {
          throw new Error("統計資料的回傳格式不正確。");
        }

        if (!controller.signal.aborted) {
          setStatistics(data);
        }
      } catch (error) {
        if (controller.signal.aborted) return;

        setError(
          error instanceof Error
            ? error.message
            : "無法取得常用語法統計，請稍後再試。",
        );
      } finally {
        if (!controller.signal.aborted) {
          setIsLoading(false);
        }
      }
    }

    void loadStatistics();

    return () => controller.abort();
  }, [user?.id]);

  const usages = statistics?.usages ?? [];
  const maxCount = usages[0]?.count ?? 0;

  return (
    <>
      <h1 className="page-title">我的常用語法</h1>

      <p className="page-description">
        使用次數以已儲存程式碼中的出現次數計算。
      </p>

      {isLoading ? (
        <p className={styles.message} role="status">
          正在讀取常用語法統計…
        </p>
      ) : error ? (
        <p className={styles.error} role="alert">
          {error}
        </p>
      ) : statistics?.record_count === 0 ? (
        <section
          className={styles.empty}
          aria-labelledby="statistics-empty-title"
        >
          <div className={styles.icon} aria-hidden="true">
            {"{ }"}
          </div>

          <h2 id="statistics-empty-title">還沒有儲存的程式碼</h2>

          <p>從第一段程式碼開始，留下你的語法足跡。</p>

          <p>貼上程式碼、完成分析並儲存後，就能在這裡回顧與編輯。</p>

          <Link href="/" className={styles.startButton}>
            ＋ 開始分析程式碼
          </Link>
        </section>
      ) : (
        <section
          className={styles.section}
          aria-labelledby="syntax-ranking-title"
        >
          <div className={styles.heading}>
            <h2 id="syntax-ranking-title">Python 常用語法</h2>
            <span>共 {usages.length} 種語法</span>
          </div>

          <div className={styles.card}>
            {usages.length === 0 ? (
              <p className={styles.noUsages}>
                目前尚無語法使用統計。已儲存的程式碼尚未辨識到目前支援的語法項目。
              </p>
            ) : (
              <ol className={styles.list}>
                {usages.map((syntax, index) => {
                  // 第一名為滿格，其餘依使用次數比例顯示
                  const width =
                    maxCount > 0 ? (syntax.count / maxCount) * 100 : 0;

                  return (
                    <li className={styles.item} key={syntax.id}>
                      <span className={styles.rank} aria-hidden="true">
                        {String(index + 1).padStart(2, "0")}
                      </span>

                      <div className={styles.content}>
                        <div className={styles.label}>
                          <span className={styles.name}>{syntax.name}</span>

                          <span className={styles.count}>
                            {syntax.count} 次
                          </span>
                        </div>

                        <div className={styles.track} aria-hidden="true">
                          <div
                            className={styles.bar}
                            style={{ width: `${width}%` }}
                          />
                        </div>
                      </div>
                    </li>
                  );
                })}
              </ol>
            )}
          </div>
        </section>
      )}
    </>
  );
}
