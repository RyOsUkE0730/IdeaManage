# テーブル定義
## categoriesテーブル
### アイデアのカテゴリーを保存するテーブル
- id: bigint PK
- name: string null: false カテゴリー名称。ユニーク制約をつけてください。
- created_at: datetime
- updated_at: datetime
## ideasテーブ 
### アイデアを保存するテーブル
- id: bigint PK
- category_id: bigint null: false (categoriesテーブルのFK)
- body: text null: false アイデア本文
- created_at: datetime
- updated_at: datetime<br>
# API定義
## 1. アイデア登録API
### 仕様
リクエストのcategory_nameがcategoriesテーブルのnameに存在する場合<br>
・categoryのidをcategory_idとして、ideasテーブルに登録してください。<br>
リクエストのcategory_nameがcategoriesテーブルのnameに存在しない場合<br>
・新たなcategoryとしてcategoriesテーブルに登録し、ideasテーブルに登録してください。<br>
### リクエスト
* category_name（カテゴリー名）:string null: false
* body（本文）:string null: false
### レスポンス
成功時 HTTPステータスコード201を返してください。<br>
失敗時(バリデーションエラー) HTTPステータスコード422を返してください。
## 2. アイデア取得API
### 仕様
アイデアの一覧を返却してください。<br>
category_nameが指定されている場合は<br>
該当するcategoryのideasの一覧を返却してください。<br>
category_nameが指定されていない場合は全てのideasを返却してください。
### リクエスト
* category_name（カテゴリー名）:string<br>
### レスポンス
返却するレスポンスは、以下のようにキーをdataで配列にし、<br>
id, category, body, created_atを返してください。<br>
また、categoryは名称で返し、作成時間(created_at)はunixtimeで返してください<br>
"{<br>
""data"": [<br>
{<br>
""id"": 1,<br>
""category"": ""アプリ"",<br>
""body"": ""タスク管理ツール"",<br>
""created_at"": 1619835764<br>
},<br>
{<br>
""id"": 2,<br>
""category"": ""会議"",<br>
""body"": ""オンラインでブレスト"",<br>
""created_at"": 1624248667<br>
}<br>
]<br>
}"<br><br>
登録されていないカテゴリーのリクエストの場合はステータスコード404を返してください。<br>
# その他
課題はRuby on Railsで作成してください。<br>
テストはRSpecで書いてください。<br>
rubocopを入れてください。<br>
他、開発を進めるのに便利なgemやツールがあればいれてください。