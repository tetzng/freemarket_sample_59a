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

## create_usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|text|null: false|
|e-mail|integer|null: false|
|password|integer|null: false|
|first_name|integer|null: false|
|last_name|text|null: false|
|first_name_kana|text|null: false|
|last_name_kana|text|null: false|
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
|create_user_id|integer|null: false|
|first_name|text|null: false|
|last_name|text|null: false|
|first_name_kana|text|null: false|
|last_name_kana|text|null: false|
|postcode|integer|null: false|
|prefecture|text|null: false|
|city|text|null: false|
|house_num|text|null: false|
|buiding_num|text|null: false|
|phone_num|integer|null: false|

### Association
- belongs_to :create_users
- belongs_to :shopping_origin_addresses
- has_many :products


## paymentsテーブル

|Column|Type|Options|
|------|----|-------|
|create_user_id|text|null: false|
|card_num|integer|null: false|
|limit_month|integer|null: false|
|limit_year|integer|null: false|
|security_code|integer|null: false|

### Association
- belongs_to :create_users
- has_many :products
- has_many :puchases


## profilesテーブル

|Column|Type|Options|
|------|----|-------|
|create_user_id|integer|null: false|
|content|text|null: false|

### Association
- belongs_to :create_users


## pointsテーブル

|Column|Type|Options|
|------|----|-------|
|create_user_id|integer|null: false|
|get_point|text|null: false|
|point_limit|text|null: false|
|saler_id|integer|null: false|
|buyer_id|integer|null: false|


### Association
- belongs_to :create_users
- has_many :products
- has_many :puchases


## projectsテーブル

|Column|Type|Options|
|------|----|-------|
|create_user_id|integer|null: false|
|image_1|string|null: false|
|image_2|string|null: false|
|image_3|string|null: false|
|image_4|string|null: false|
|image_5|string|null: false|
|image_6|string|null: false|
|image_7|string|null: false|
|image_8|string|null: false|
|image_9|string|null: false|
|image_10|string|null: false|
|name|text|null: false|
|description|text|null: false|
|condition|integer|null: false|
|delivery_charge|integer|null: false|
|delivery_area|integer|null: false|
|delivery_days|integer|null: false|
|price|integer|null: false|
|saler_id|integer|null: false|
|status|integer|null: false|

### Association
- belongs_to :create_users


## purchasesテーブル

|Column|Type|Options|
|------|----|-------|
|create_user_id|integer|null: false|
|product_id|integer|null: false|
|buyer_id|integer|null: false|
|status|integer|null: false|

### Association
- belongs_to :create_users


## likesテーブル

|Column|Type|Options|
|------|----|-------|
|create_user_id|integer|null: false|
|product_id|integer|null: false|

### Association
- belongs_to :create_users


## todo_listsテーブル

|Column|Type|Options|
|------|----|-------|
|project_id|integer|null: false|
|purchase_id|integer|null: false|


### Association
- belongs_to :create_users
- has_many :products
- has_many :purchases


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|create_user_id|integer|null: false|
|produts_id|integer|null: false|
|produts_id|integer|null: false|

### Association
- belongs_to :create_users
- has_many :products
- has_many :purchases