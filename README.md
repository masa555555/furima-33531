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
| preparation_day_id        | integer                  | null: false.foreign_key: true     |
| item_condition_id         | integer                  | null: false.foreign_key: true     |
| category_id               | integer                  | null: false.foreign_key: true     |
| shipping_fee_id           | integer                  | null: false.foreign_key: true     |
| prefecture_id             | integer                  | null: false.foreign_key: true     |
| user                      | references               | null: false.foreign_key: true     |

### Association
- belongs_to :user
- has_many :comments
- has_one  :order


## orders table
| Column                    | Type                     | Option                            |
|---------------------------|--------------------------|-----------------------------------|
| user                      | references               | null: false.foreign_key:  true    |
| item                      | references               | null: false.foreign_key:  true    |
|                           |                          |                                   |

### Association
- belongs_to :user
- belongs_to  :item
- has_one  :sending_destination


## sending_destinations
| Column                       | Type                     | Option                         |
|------------------------------|--------------------------|--------------------------------|
| post_code                    | string                   | null: false                    |
| prefecture_id                | integer                  | null: false.foreign_key: true  |
| city                         | string                   | null: false                    |
| house_number                 | string                   | null: false                    |
| building_name                | string                   |                                |
| phone_number                 | string                   | null: false                    |
| order                        | references               | null: false.foreign_key:  true |
### Association
- belongs_to :order


