# README
# DB 設計

## users table

| Column                    | Type                     | Option                  |
|---------------------------|--------------------------|-------------------------|
| nickname                  | string                   | null: false             |
| encrypted_password        | string                   | null: false,default:""  |
| email                     | string                   | null: false             |
| first_name                | string                   | null: false             |
| family_name               | string                   | null: false             |
| first_name_kana           | string                   | null: false             |
| family_name_kana          | string                   | null: false             |
| birth_date                | integer                  | null: false             |
|                           |                          |                         |
|                           |                          |                         |
|                           |                          |                         |
|                           |                          |                         |
|                           |                          |                         |
|                           |                          |                         |
### Association
- has_many    :items
- has_many    :comments
- has_many    :orders









## items table
| Column                    | Type                     | Option                            |
|---------------------------|--------------------------|-----------------------------------|
| name                      | string                   | null: false                       |
| description               | text                     | null: false                       |
| price                     | integer                  | null: false                       |
| size_id                   | integer                  | null: false.foreign_key: true     |
| preparation_day_id        | integer                  | null: false.foreign_key: true     |
| item_condition_id         | integer                  | null: false.foreign_key: true     |
| category_id               | integer                  | null: false.genre_id              |
| shipping_fee_id           | integer                  | null: false.foreign_key: true     |
| user_id                   | reference                | null: false.foreign_key: true     |

### Association
- belongs_to :user
- belongs_to :category_id
- belongs_to_active_hash :size_id
- belongs_to_active_hash :item_condition_id
- belongs_to_active_hash :shipping_fee_id
- belongs_to_active_hash :preparation_day_id
- belongs_to :user_id, class_name: "user"
- has_many :comments
- has_one  :order

## sizes(active_hash)
| Column                    | Type                     | Option                            |
|---------------------------|--------------------------|-----------------------------------|
| size                      | integer                  | null: false                       |
### Association
- has_many :items

## categories
| Column                    | Type                     | Option                            |
|---------------------------|--------------------------|-----------------------------------|
| name                      | integer                  |  null: false                      |

### Association
  has_many :items


## item_conditions(active_hash)
| Column                    | Type                     | Option                            |
|---------------------------|--------------------------|-----------------------------------|
| item_condition            | integer                  |  null: false                      |
### Association 
- has_many :items


## shipping_fees (active_hash)
| Column                    | Type                     | Option                            |
|---------------------------|--------------------------|-----------------------------------|
| postage_payer             | integer                  |  null: false                      |
### Association
- has_many :items


## preparation_days(active_hash)
| Column                    | Type                     | Option                            |
|---------------------------|--------------------------|-----------------------------------|
| preparation_day           | integer                  |  null: false                      |
### Association
- has_many :items















## orders table
| Column                    | Type                     | Option                            |
|---------------------------|--------------------------|-----------------------------------|
| user                      | references               | null: false.foreign_key:  true    |
| item                      | references               | null: false.foreign_key:  true    |
|                           |                          |                                   |
|                           |                          |                                   |
|                           |                          |                                   |
|                           |                          |                                   |
|                           |                          |                                   |
|                           |                          |                                   |
|                           |                          |                                   |
|                           |                          |                                   |
### Association
- belongs_to :user
- belongs_to  :item
- has_one  :sending_destination


## sending_destinations
| Column                       | Type                     | Option                         |
|------------------------------|--------------------------|--------------------------------|
| post_code                    | string                   | null: false                    |
| prefecture_code              | integer                  | null: false                    |
| city                         | string                   | null: false                    |
| house_number                 | string                   | null: false                    |
| building_name                | string                   |                                |
| phone_number                 | string                   | null: false                    |
| user                         | references               | null: false.foreign_key:  true |
### Association
- belongs_to :order








## comments
| Column                    | Type                     | Option                            |
|---------------------------|--------------------------|-----------------------------------|
|                           |                          |                                   |
|                           |                          |                                   |
|                           |                          |                                   |
|                           |                          |                                   |
|                           |                          |                                   |
|                           |                          |                                   |
|                           |                          |                                   |
|                           |                          |                                   |
|                           |                          |                                   |
|                           |                          |                                   |


### Association
belongs_to :item
belongs_to :user

