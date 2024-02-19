# テーブル設計

## usersテーブル

|Column                | Type     | Options                   |
|----------------------|----------|---------------------------|
|nickname              | string   | null: false               |
|email                 | string   | null: false, unique: true |
|encrypted_password    | string   | null: false               |
|first_name            | string   | null: false               |
|last_name             | string   | null: false               |
|first_pronunciation   | string   | null: false               |
|last_pronunciation    | string   | null: false               |
|birth_year_id         | integer  | null: false               |
|birth_month_id        | integer  | null: false               |
|birthday_id           | integer  | null: false               |


### Association
- has_many :items
- has_many :purchase_histories


## itemsテーブル

|Column             | Type       | Options                      |
|-------------------|------------|------------------------------|
|title              | string     | null: false                  |
|content            | text       | null: false                  |
|category_id        | integer    | null: false                  |
|preservation_id    | integer    | null: false                  |
|delivery_charge_id | integer    | null: false                  |
|prefecture_id      | integer    | null: false                  |
|delivery_time_id   | integer    | null: false                  |
|amount             | integer    | null: false                  |
|user               | references | null: false,foreign_key: true|

### Association
- belongs_to :user
- has_one :purchase_history



## addressesテーブル

| Column             | Type       | Options                       |
|--------------------|------------|-------------------------------|
| postal_code        | string     | null: false                   |
| prefecture_id      | integer    | null: false                   |
| municipalities     | string     | null: false                   |
| street_address     | string     | null: false                   |
| building_name      | string     |                               |
| telephone_number   | string     | null: false                   |
| purchase_history   | references | null: false,foreign_key: true |

### Association
- belongs_to :purchase_history


## purchase_historiesテーブル

| Column           | Type       | Options                       |
|------------------|------------|-------------------------------|
| user             | references | null: false,foreign_key: true |
| item             | references | null: false,foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address