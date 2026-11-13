"use client";

import CodeMirror from "@uiw/react-codemirror";
import { Decoration, EditorView } from "@codemirror/view";

// 唯讀範例的視覺續行多縮排兩格，原始內容與複製結果不變。
const exampleWrapping = EditorView.decorations.compute(["doc"], (state) => {
  const lines = [];
  for (let number = 1; number <= state.doc.lines; number++) {
    const line = state.doc.line(number);
    const whitespace = line.text.match(/^[\t ]*/)?.[0] ?? "";
    const columns = [...whitespace].reduce(
      (count, character) =>
        character === "\t" ? count + 4 - (count % 4) : count + 1,
      0,
    );
    // 深層縮排限制視覺位移，避免續行的可用寬度過小。
    const indent = Math.min(columns + 2, 12);
    lines.push(
      Decoration.line({
        attributes: {
          style: `padding-left: calc(6px + min(${indent}ch, 25%)); text-indent: calc(-1 * min(${indent}ch, 25%));`,
        },
      }).range(line.from),
    );
  }
  return Decoration.set(lines);
});

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
  exampleWrapping,
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
