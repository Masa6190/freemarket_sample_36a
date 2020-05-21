## ■ URL
- IPアドレス：http://18.181.23.135/

### ■ Basic認証
- ID：team66-a
- Pass：6666

### ■ テスト用アカウント
◯ 購入者用
- メールアドレス：buyer@gamil.com
- パスワード：1234567

◯ 購入用カード情報
- 番号：4242424242424242
- 期限：12/20
- セキュリティカード：123

◯ 出品者用
- メールアドレス：seller@gmail.com
- パスワード：1234567


## アプリ仕様
### ユーザー同士で品物を売買出来るフリーマーケットアプリになります。

### 出品
- ユーザー登録かつ、ユーザーの本人情報を入力することにより、商品を画像付きで出品することができます。（画像は一枚以上必須）
- ユーザー離れを防ぐため、ユーザー登録時、最初は項目を減らし、本格的に使用する場合に詳しい情報を入力させています。
- ユーザーは複数の商品を同時に出品することができます。
- 出品した商品は出品したユーザーのみ後から編集を行うことができます。

### 購入
- ユーザー登録かつ、クレジットカードの登録を行なっている場合、購入できます。
- 購入された物については、トップページの新着一覧には除外されます。
- ヘッダーのテキストフィールドから商品を検索することができます。
- 自分が出品している商品については購入画面へのリンクが表示されないようになっております。

### その他機能
- トップページには売り切れを除く新着3件を表示しています
- カテゴリ一覧ページが商品詳細ページの親カテゴリにございます。（今回はレディースのみ実装済み）
- 商品を検索する場合は、あいまい検索で検索できます。ブランクで検索を行なった場合は一覧で表示されます。

# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false,unique:true|
|password|string|nill :false|

### Association
- has_many :items
- has_many :buyers
- has_one :card
- has_one :address


## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|null: false|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
- belongs_to :user

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|null: false|
|familyname|string|null: false|
|firstname|string|null: false|
|familyname_kana|string|null: false|
|firstname_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: faise|
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|integer|null:false|
|building|string|
|phone_number|string|
|familyname_deliver|string|null:false|
|firstname_deliver|string|null:false|
|familyname_kana_deliver|string|null:false|
|firstname_kana_deliver|string|null:false|
### Association
- belongs_to :user

## buyersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|null: false|
|items_id|bigint|null: false|
### Association
- belongs_to :user
- belongs_to :item


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|text|text|null: false|
|status_id|string|null: false|
|burden_id|string|null: false|
|area_id|string|null: false|
|days_to_ship_id|integer|null: false|
|selling_price|integer|null: false|
|category_id|bigint|null: false|
|buyer_id|bigint|foreign_key:true|
|saler_id|bigint|foreign_key:true|
|brand|string||
### Association
- has_many :images
- has_one :buyer
- belongs_to :category
- belongs_to :user
### add_index
- add_index :item_name


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|bigint|null: false|
|image|string|null: false|
### Association
- belongs_to :item

## categories
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|
### Association
- has_many :items
### add_index
- add_index :ancestry
