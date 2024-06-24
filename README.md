# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| fitst_name_kana    | string | null: false |
| dob                | date   | null: false |

## items テーブル

| Column             | Type       | Options     |
| item_name          | string     | null: false |
| description        | text       | null: false |
| category           | integer    | null: false |
| condition          | integer    | null: false |
| shipping_fee       | integer    | null: false |
| shipping_from      | integer    | null: false |
| shipping_days      | integer    | null: false |
| price              | integer    | null: false |
| sold               | integer    |             |
| user_id            | references | null: false, foreign_key: true |


## purchasers テーブル

| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| postal_code        | string     | null: false |
| prefecture         | string     | null: false |
| city               | string     | null: false |
| street_address     | string     | null: false |
| building_name      | string     |             |
| phone_number       | integer    | null: false |
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |