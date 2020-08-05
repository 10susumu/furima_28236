#テーブル設計

## usersテーブル
｜Column｜Type｜Options|
|---|---|---|
|name|string|nil: false|
|nickname|string|nil: false|
|e-mail|string|nil: false|
|password|string|nil: false|
|birthday|date|nil: false|
### Association
- has_many :User_address
- has_many :Cards
- has_many :Items

## User_address
|Column|Type|Options|
|---|---|---|
|user_id|references|nil: false, foreign_key: true|
|postal_code|integer|nil: false|
|prefectures|string|nil: false|
|city|string|nil: false|
|address_line1|string|nil: false|
|address_line2|string|nil: false|
|phone_number|integer|nil: false|
### Association
- belongs_to :Users

## Cards
|Column|Type|Options|
|---|---|---|
|user_id|references|nil: false, foreign_key: true|
|card_number|integer|nil: false|
|card_expiration|date|nil: false|
|cvc|integer|nil: false|
### Association
-belongs_to :Users

## Items
|Column|Type|Options|
|---|---|---|
|user_id|references|nil: false|
|images|string|nil: false|
|item_name|string|nil: false|
|description|text||
|category|string||
|status|string|nil: false|
|shipping_charges|string|nil: false|
|shipping_region|string|nil: false|
|day_until_shipping|string|nil: false|
|price|integer|nil: false|
|selling|boolean|nil: false|
### Association
-belongs_to :Users