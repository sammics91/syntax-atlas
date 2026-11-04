import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  /* config options here */

  // React
  reactCompiler: true,

  // API 轉送請求
  async rewrites() {
    return [
      {
        source: "/api/analyses",
        destination: "http://127.0.0.1:8000/api/analyses",
      },
      {
        source: "/api/syntaxes",
        destination: "http://127.0.0.1:8000/api/syntaxes",
      },
    ];
  },

  // 建置工具與 CSS 處理
  turbopack: {
    rules: {
      "*.css": {
        condition: {
          not: {
            path: "*.module.css",
          },
        },
        loaders: ["@tailwindcss/turbopack"],
        as: "*.css",
      },
    },
  },
};

export default nextConfig;
