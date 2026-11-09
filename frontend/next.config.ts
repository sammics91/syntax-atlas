import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  // 產生 Docker 執行需要的獨立版本
  output: "standalone",

  // React
  reactCompiler: true,

  // 將 API 請求轉送到 FastAPI
  async rewrites() {
    const apiUrl = process.env.API_INTERNAL_URL ?? "http://127.0.0.1:8000";

    return [
      {
        source: "/api/:path*",
        destination: `${apiUrl}/api/:path*`,
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
