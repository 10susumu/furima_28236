#テーブル設計

## usersテーブル
｜Column｜Type｜Options|
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
### Association
- has_many :Users_items
- has_one :Address

## Users_itemsテーブル
|Column|Type|Options|
|---|---|---|
|user|references|nil: false|
|item|references|nil: false|
### Association
- belongs_to :User
- belongs_to :Item