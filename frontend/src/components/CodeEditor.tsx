"use client";

import { useMemo } from "react";
import CodeMirror from "@uiw/react-codemirror";
import { html } from "@codemirror/lang-html";
import { python } from "@codemirror/lang-python";
import {
  HighlightStyle,
  indentUnit,
  syntaxHighlighting,
} from "@codemirror/language";
import { tags } from "@lezer/highlight";
import { EditorView } from "@codemirror/view";

type CodeEditorProps = {
  value: string;
  onChange: (value: string) => void;
  disabled?: boolean;
};

// 編輯器沿用網站的全域色票。
const editorTheme = EditorView.theme({
  "&": {
    border: "1px solid var(--border)",
    borderRadius: "6px",
    backgroundColor: "var(--page-bg)",
    color: "var(--text)",
    fontSize: "14px",
  },
  "&.cm-focused": {
    outline: "2px solid var(--chart-gray)",
    outlineOffset: "2px",
  },
  ".cm-scroller": {
    fontFamily: 'Consolas, "Courier New", monospace',
    lineHeight: "1.7",
  },
  ".cm-content": {
    padding: "12px 0",
    caretColor: "var(--text)",
  },
  ".cm-gutters": {
    borderRight: "1px solid var(--border)",
    borderRadius: "6px 0 0 6px",
    backgroundColor: "var(--soft-bg)",
    color: "var(--text-muted)",
  },
  "@media (max-width: 640px)": {
    "&": {
      fontSize: "16px",
    },
  },
});

// 語法上色使用網站色票，不使用警告紅色。
const editorHighlightStyle = HighlightStyle.define([
  {
    tag: tags.keyword,
    color: "var(--primary)",
    fontWeight: "700",
  },
  {
    tag: [tags.string, tags.character, tags.regexp],
    color: "var(--accent-on-green)",
  },
  {
    tag: tags.number,
    color: "var(--accent-on-green)",
  },
  {
    tag: [tags.bool, tags.null],
    color: "var(--primary)",
  },
  {
    tag: tags.comment,
    color: "var(--text-muted)",
    fontStyle: "italic",
  },
  {
    tag: [tags.operator, tags.tagName],
    color: "var(--primary)",
  },
  {
    tag: tags.attributeName,
    color: "var(--accent-on-green)",
  },
]);

export default function CodeEditor({
  value,
  onChange,
  disabled = false,
}: CodeEditorProps) {
  // 只決定編輯器上色；正式語言辨識仍由後端負責。
  const looksLikeHtml = /^\s*</.test(value);

  const extensions = useMemo(
    () => [
      looksLikeHtml ? html() : python(),
      syntaxHighlighting(editorHighlightStyle),
      indentUnit.of("    "),
      EditorView.contentAttributes.of({
        "aria-label": "程式碼內容",
        spellcheck: "false",
        autocapitalize: "off",
        autocorrect: "off",
      }),
    ],
    [looksLikeHtml],
  );

  return (
    <CodeMirror
      value={value}
      minHeight="210px"
      maxHeight="500px"
      theme={editorTheme}
      extensions={extensions}
      editable={!disabled}
      readOnly={disabled}
      indentWithTab
      placeholder="在這裡貼上你的 Python 或 HTML 程式碼"
      basicSetup={{
        lineNumbers: true,
        foldGutter: true,
        highlightActiveLine: true,
        bracketMatching: true,
        closeBrackets: true,
        autocompletion: false,
      }}
      onChange={(nextValue) => onChange(nextValue)}
    />
  );
}
