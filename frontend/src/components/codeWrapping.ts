import { Decoration, EditorView } from "@codemirror/view";

// 編輯器與唯讀範例共用視覺續行縮排；原始內容與複製結果不變。
export const wrappedLineIndent = EditorView.decorations.compute(
  ["doc"],
  (state) => {
    const lines = [];
    for (let number = 1; number <= state.doc.lines; number++) {
      const line = state.doc.line(number);
      // 空白行不需要續行縮排，避免提示文字繼承負縮排而被行號遮住。
      if (line.text.length === 0) continue;
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
  },
);
