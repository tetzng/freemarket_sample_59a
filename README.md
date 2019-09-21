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
|phone_num|integer|null: false|
|authentication_num|integer|null: false|

### Association
- has_many :products
- has_many :puchases
- has_many :likes

## shopping_origin_addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
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
- belongs_to :shopping_origin_address
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


## profilesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|content|text|null: false|

### Association
- belongs_to :user



## productsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false|
|image_1|text|null: false|
|image_2|text|null: false|
|image_3|text|null: false|
|image_4|text|null: false|
|image_5|text|null: false|
|image_6|text|null: false|
|image_7|text|null: false|
|image_8|text|null: false|
|image_9|text|null: false|
|image_10|text|null: false|
|name|string|null: false|
|description|text|null: false|
|condition|string|null: false|
|delivery_charge|string|null: false|
|delivery_area|string|null: false|
|delivery_days|string|null: false|
|price|integer|null: false|
|saler_id|integer|null: false|
|status|string|null: false|

### Association
- belongs_to :user


## purchasesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false|
|selar_id|integer|null: false|
|buyer_id|integer|null: false|
|status|string|null: false|

### Association
- belongs_to :user


## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false|
|product_id|integer|null: false|

### Association
- belongs_to :user


## likes_userテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false|
|product_id|integer|null: false|

### Association
- belongs_to :user
- has_many :products 



## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|references|null: false|
|produts_id|integer|null: false|
|produts_id|integer|null: false|

### Association
- belongs_to :user
- has_many :products
- has_many :purchases