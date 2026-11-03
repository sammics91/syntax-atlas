export default function DictionaryPage() {
  return (
    <>
      <h1 className="page-title">語法辭典</h1>

      <p className="page-description">
        以下暫時放入測試內容，用來確認長頁面的版面。
      </p>

      <div className="mt-8 space-y-6">
        {Array.from({ length: 20 }, (_, index) => (
          <p key={index}>語法資料測試項目 {index + 1}</p>
        ))}
      </div>
    </>
  );
}