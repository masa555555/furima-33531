# README
# DB 設計

## users table

| Column                    | Type                     | Option                  |
|---------------------------|--------------------------|-------------------------|
| nickname                  | string                   | null: false             |
| password                  | string                   | null: false             |
| email                     | string                   | null: false             |
| first_name                | string                   | null: false             |
| family_name               | string                   | null: false             |
| first_name_kana           | string                   | null: false             |
| family_name_kana          | string                   | null: false             |
|                           |                          |                         |
|                           |                          |                         |
|                           |                          |                         |
|                           |                          |                         |
|                           |                          |                         |
|                           |                          |                         |
|                           |                          |                         |
### Association
- has_many :items
- has_many    :comments
- belongs_to  :order









## items table
| Column                    | Type                     | Option                            |
|---------------------------|--------------------------|-----------------------------------|
| name                      | string                   | null: false                       |
| description               | text                     | null: false                       |
| price                     | integer                  | null: false                       |
| size                      | reference                | null: false.foreign_key: true     |
| preparation_day           | reference                | null: false.foreign_key: true     |
| item_condition            | reference                | null: false.foreign_key: true     |
| category_id               | integer                  | null: false.genre_id              |
| postage_payer             | reference                | null: false.foreign_key: true     |
| seller                    | reference                | null: false.foreign_key: true     |
| buyer                     | reference                | null: false.foreign_key: true     |
| deal_closed_data          | timestamp                |                                   |
| item_img                  | reference                | null: false.foreign_key: true     |
|                           |                          |                                   |
|                           |                          |                                   |
|                           |                          |                                   |
### Association
- belongs_to :order
- belongs_to :user
- belongs_to :category_id
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :postage_payer
- belongs_to_active_hash :preparation_day
- belongs_to :seller, class_name: "user"
- belongs_to :buyer, class_name: "user"
- has_many :comments
- has_many :item_imgs, dependent: :destroy 



## category_id
| Column                    | Type                     | Option                            |
|---------------------------|--------------------------|-----------------------------------|
| name                      | string                   |  null: false                      |

### Association
  has_many :items


## item_conditions(active_hash)
| Column                    | Type                     | Option                            |
|---------------------------|--------------------------|-----------------------------------|
| item_condition            | string                   |  null: false                      |
### Association 
- has_many :items


## postage_payer(active_hash)
| Column                    | Type                     | Option                            |
|---------------------------|--------------------------|-----------------------------------|
| postage_payer               | string                   |  null: false                      |
### Association
- has_many :items


## preparation_days(active_hash)
| Column                    | Type                     | Option                            |
|---------------------------|--------------------------|-----------------------------------|
| preparation_day_id        | string                   |  null: false                      |
### Association
- has_many :items


## itemimgs
| Column                    | Type                     | Option                            |
|---------------------------|--------------------------|-----------------------------------|
| item                      | references               | null: false.foreign_key:  true    |
| url                       | string                   | null: false                       |
### Association
- belongs_to :item












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
- has_one_to :user
- belongs_to  :item
- belongs_to  :sending_destinations


## sending_destinations
| Column                       | Type                     | Option                         |
|------------------------------|--------------------------|--------------------------------|
| destination_first_name       | string                   | null: false                    |
| destination_family_name      | string                   | null: false                    |
| destination_first_name_kana  | string                   | null: false                    |
| destination_family_name_kana | string                   | null: false                    |
| post_code                    | integer                  | null: false                    |
| prefecture_code              | integer                  | null: false                    |
| city                         | string                   | null: false                    |
| house_number                 | string                   | null: false                    |
| building_name                | string                   |                                |
| phone_number                 | integer                  | unique: true                   |
| user                         | references               | null: false.foreign_key:  true |
### Association
- has_many :orders








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
