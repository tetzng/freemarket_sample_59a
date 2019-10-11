# freemarket_sample_59a
フリマアプリ「メルカリ」のクローンサイト。

## Description
フリマアプリ「メルカリ」のクローンサイト。誰でも簡単に売り買いが楽しめるフリマアプリの機能を再現したページ。
ユーザー登録、商品出品、商品購入などの機能が再現されていますが、実際の取引はできません。

***DEMO:***


## Features

- haml/SASS記法と、命名規則BEMを使ったマークアップ
- ウィザード形式を用いたユーザー登録フォーム
- SNS認証による新規登録、ログイン
- ajaxを使用した非同期処理
- pay.jpによる購入処理
- capistranoによるAWS EC2への自動デプロイ
- ActiveStorageを使用しAWS S3への画像アップロード
- RSpecを使った単体テスト

## Requirement

- Ruby 2.5.1
- Rails 5.2.3

## Installation

    $ git clone https://github.com/tetzng/freemarket_sample_59a.git
    $ cd freemarket_sample_59a
    $ bundle install


## Author

[@tetzng](https://twitter.com/tp_237)
[@yuuspe]()
[@kurachitoshiaki]()
[@seicode]()
[@enahamada]()

## License

[MIT](http://b4b4r07.mit-license.org)


## Usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|encrypted_password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday_yyyy_id|integer|null: false|
|birthday_mm_id|integer|null: false|
|birthday_dd_id|integer|null: false|
|phone_num|string|null: false|
|authentication_num|integer|null: false|
|content|text|
|address|references|null: false, foreign_key: true|
|telephone|string|

### Association
- belongs_to_active_hash :birth_yyyy
- belongs_to_active_hash :birth_mm
- belongs_to_active_hash :birth_dd
- belongs_to_active_hash :prefecture
- has_many :products
- has_one :card
- has_one :address


## Addressテーブル
|Column|Type|Options|
|------|----|-------|
|zip_code1|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|address1|string|
|address2|string|

### Association
- belongs_to :user

## Productsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|name|string|null: false|
|description|text|
|category|references|null: false, foreign_key: true|
|condition|references|null: false, foreign_key: true|
|size|references|null: false, foreign_key: true|
|brand|string|
|delivery_charge|references|null: false, foreign_key: true|
|delivery_way|references|null: false, foreign_key: true|
|prefecture|references|null: false, foreign_key: true|
|delivery_days|references|null: false, foreign_key: true|
|price|integer|null: false|
|status|references|null: false, foreign_key: true|

### Association
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :size
- belongs_to_active_hash :delivery_charge
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :delivery_days
- belongs_to_active_hash :delivery_way
- belongs_to_active_hash :status
- has_many_attached :images
- belongs_to :user
- add_index :products, :name


## Cardテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|customer_id|string|
|card_id|string|

### Association
- belongs_to :user


## Categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|sub|integer|
|sub_sub|integer|
|size|integer|
|brand|integer|

### Association
- has_many :products


## Conditionテーブル
|Column|Type|Options|
|------|----|-------|
|value|string|null: false|

### Association
- has_many :products


## Sizeテーブル
|Column|Type|Options|
|------|----|-------|
|value|string|null: false|
|group|integer|

### Association
- has_many :products


## DeliveryChargeテーブル
|Column|Type|Options|
|------|----|-------|
|value|string|null: false|

### Association
- has_many :products


## DeliveryDaysテーブル
|Column|Type|Options|
|------|----|-------|
|value|string|null: false|

### Association
- has_many :products

## DeliveryWayテーブル
|Column|Type|Options|
|------|----|-------|
|value|string|null: false|
|charge|integer|

### Association
- has_many :products


## Prefectureテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :products

## Statusテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :products
