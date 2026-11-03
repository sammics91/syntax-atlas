"use client";

import { useState } from "react";
import styles from "./page.module.css";

export default function HomePage() {
  const [title, setTitle] = useState("");
  const [code, setCode] = useState("");

  return (
    <>
      <h1 className="page-title">這次，你用了哪些語法？</h1>

      <p className="page-description">貼上程式碼，讓每一次練習都留下足跡。</p>

      <section className={styles.editor} aria-label="程式碼分析輸入區">
        <div className={styles.titleField}>
          <label htmlFor="code-title">程式碼名稱</label>

          <input
            id="code-title"
            name="title"
            type="text"
            placeholder="ex: 購物清單練習 (選填)"
            maxLength={30}
            value={title}
            onChange={(event) => setTitle(event.target.value)}
          />
        </div>

        <div className={styles.codeField}>
          <textarea
            id="code-content"
            name="code"
            placeholder="在這裡貼上你的 Python 程式碼"
            spellCheck={false}
            autoCapitalize="off"
            autoCorrect="off"
            value={code}
            onChange={(event) => setCode(event.target.value)}
          />
        </div>

        <div className={styles.actions}>
          <p className={styles.characterCount}>目前輸入 {code.length} 個字元</p>

          <button
            type="button"
            className={styles.analyzeButton}
            disabled
            title="分析功能尚未串接"
          >
            分析程式碼 →
          </button>
        </div>
      </section>
    </>
  );
}
