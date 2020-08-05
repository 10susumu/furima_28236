#テーブル設計

## usersテーブル
|Column|Type|Options|
|---|---|---|
|last_name|string|nil: false|
|first_name|string|nil: false|
|last_name_reading|string|nil: false|
|first_name_reading|string|nil: false|
|nickname|string|nil: false|
|email|string|nil: false|
|password|string|nil: false|
|birthday|date|nil: false|
### Association
- has_many :Users_items

## Addressesテーブル
|Column|Type|Options|
|---|---|---|
|item|references|nil: false, foreign_key: true|
|postal_code|integer|nil: false|
|prefectures|string|nil: false|
|city|string|nil: false|
|address_line1|string|nil: false|
|address_line2|string|nil: false|
|phone_number|integer|nil: false|
### Association
- belongs_to :item

## Itemsテーブル
|Column|Type|Options|
|---|---|---|
|user|references|nil: false|
|images|string|nil: false|
|name|string|nil: false|
|description|text|nil :false|
|price|integer|nil: false|
|category_id|integer|nil: false|
|status_id|integer|nil: false|
|shipping_charges_id|integer|nil: false|
|shipping_region_id|integer|nil: false|
|day_until_shipping_id|integer|nil: false|
### Association
- has_many :Users_items
- has_one :Address
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :shipping_charges
- belongs_to_active_hash :shipping_region
- belongs_to_active_hash :day_until_shipping

## Users_itemsテーブル
|Column|Type|Options|
|---|---|---|
|user|references|nil: false|
|item|references|nil: false|
### Association
- belongs_to :User
- belongs_to :Item