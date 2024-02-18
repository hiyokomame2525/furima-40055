# テーブル設計

## usersテーブル

| Colimn                | Type   | Options     |
|-----------------------|--------|-------------|
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| first_name            | string | null: false |
| last_name             | string | null: false |
| first_pronunciation   | string | null: false |
| last_pronunciation    | string | null: false |

- has_many :items
- has_many :orders

## itemsテーブル

| Colimn          | Type       | Options                      |
|-----------------|------------|------------------------------|
| image           | string     | null: false                  |
| title           | string     | null: false                  |
| content         | string     | null: false                  |
| category        | string     | null: false                  |
| preservation    | string     | null: false                  |
| delivery charge | string     | null: false                  |
| region          | string     | null: false                  |
| delivery time   | integer    | null: false                  |
| amount          | integer    | null: false                  |
| user_id         | references | null: false,foreign_key: true|

- belongs_to :user
- has_one :order


## ordersテーブル

| Colimn           | Type       | Options                       |
|------------------|------------|-------------------------------|
| card-number      | integer    | null: false                   |
| expiration       | integer    | null: false                   |
| security         | integer    | null: false                   |
| postal code      | string     | null: false                   |
| prefecture       | string     | null: false                   |
| municipalities   | string     | null: false                   |
| street_address   | string     | null: false                   |
| building_name    | string     | null: false                   |
| telephone_number | integer    | null: false                   |
| user_id          | references | null: false,foreign_key: true |
| item_id          | references | null: false,foreign_key: true |


- belongs_to :user
- belongs_to :item
