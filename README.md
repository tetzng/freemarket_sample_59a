# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|e-mail|string|null: false|
|encrypted_password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday_year|integer|null: false|
|birthday_month|integer|null: false|
|birthday_day|integer|null: false|
|phone_num|string|null: false|
|authentication_num|integer|null: false|
|content|text||

### Association
- belongs_to :user
- has_many :shopping_origin_addresses
- has_many :products
- has_many :puchases
- has_many :comments
- has_one_attached :avatar
- has_many :likes, through: :like_users



## shopping_origin_addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|postcode|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_num|string|null: false|
|buiding_num|string|null: false|
|phone_num|integer|null: false|

### Association
- belongs_to :user
- has_many :products


## paymentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false|
|card_num|integer|null: false|
|limit_month|integer|null: false|
|limit_year|integer|null: false|
|security_code|integer|null: false|

### Association
- belongs_to :user
- has_many :products
- has_many :puchases


## productsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false|foreign_key: true|
|name|string|null: false|
|description|text||
|category_id|references|null: false|foreign_key: true|
|condition_id|references|null: false|foreign_key: true|
|size_id|references|null: false|foreign_key: true|
|brand|string|
|delivery_charge|string|null: false|
|delivery_way|string|null: false|
|delivery_area|string|null: false|
|delivery_days|string|null: false|
|price|integer|null: false|
|saler_id|references|null: false|foreign_key: true|
|status|references|null: false|foreign_key: true|

### Association
- belongs_to :user
- has_many :likes
- has_many :comments
- mount_uploader :image, ImageUploader
- add_index :products, :name #テーブル名、カラム名


## purchasesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false|
|selar_id|integer|null: false|
|buyer_id|integer|null: false|
|status|string|null: false|

### Association
- belongs_to :user
- has_many :comments


## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false|
|product_id|integer|null: false|

### Association
- belongs_to :user
- belongs_to :product


## likes_userテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false|
|product_id|integer|null: false|

### Association
- belongs_to :user
- belongs_to :product 



## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|content|text||
|user|references|null: false|
|produts_id|integer|null: false|
|produts_id|integer|null: false|

### Association
- belongs_to :user
- belongs_to :product
- belongs_to :purchase



## categoryテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association



## conditionテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :products


## sizeテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :products


## brandテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :products
