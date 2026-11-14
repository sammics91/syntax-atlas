"use client";

import CodeMirror from "@uiw/react-codemirror";
import { EditorView } from "@codemirror/view";

import { wrappedLineIndent } from "./codeWrapping";

// 範例使用單一文字顏色，不載入語言解析器與語法上色。
const exampleTheme = EditorView.theme({
  "&": {
    backgroundColor: "transparent",
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
  ".cm-content": { padding: "0" },
  ".cm-line": { overflowWrap: "anywhere" },
  "@media (max-width: 640px)": { "&": { fontSize: "16px" } },
});

const exampleExtensions = [
  EditorView.lineWrapping,
  wrappedLineIndent,
  EditorView.contentAttributes.of({ "aria-label": "程式碼範例（唯讀）" }),
];

export default function CodeExample({ value }: { value: string }) {
  return (
    <CodeMirror
      value={value}
      theme={exampleTheme}
      extensions={exampleExtensions}
      editable={false}
      readOnly
      basicSetup={false}
      indentWithTab={false}
    />
  );
}
