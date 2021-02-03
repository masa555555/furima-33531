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
| birth_date                | date                     | null: false             |
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
| user                      | reference                | null: false.foreign_key: true     |

### Association
- belongs_to :user
- belongs_to :category_id
- belongs_to_active_hash :size_id
- belongs_to_active_hash :item_condition_id
- belongs_to_active_hash :shipping_fee_id
- belongs_to_active_hash :preparation_day_id
- has_many :comments
- has_one  :order


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
| prefecture                   | string                   | null: false                    |
| city                         | string                   | null: false                    |
| house_number                 | string                   | null: false                    |
| building_name                | string                   |                                |
| phone_number                 | string                   | null: false                    |
| order                       | references               | null: false.foreign_key:  true |
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

