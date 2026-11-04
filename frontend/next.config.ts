import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  /* config options here */

  // React
  reactCompiler: true,

  // 將所有 API 請求轉送到本機 FastAPI
  async rewrites() {
    return [
      {
        source: "/api/:path*",
        destination: "http://127.0.0.1:8000/api/:path*",
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
