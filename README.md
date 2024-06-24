# テーブル設計

## users テーブル
**アソシエーション**:
 - `has_many :items, dependent: :destroy`
 - `has_many :purchases, dependent: :destroy`

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
**アソシエーション**:
 - `belongs_to :user`
 - `has_one :purchase, dependent: :destroy`

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| item_name          | string     | null: false |
| description        | text       | null: false |
| category_id        | integer    | null: false |
| condition_id       | integer    | null: false |
| shipping_fee_id    | integer    | null: false |
| prefecture_id      | integer    | null: false |
| shipping_days_id   | integer    | null: false |
| price              | integer    | null: false |
| user               | references | null: false, foreign_key: true |


## purchases テーブル
**アソシエーション**:
 - `belongs_to :user`
 - `has_one :item`
 - `has_one :addresse, dependent: :destroy`

| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

## addresses テーブル
**アソシエーション**:
 - `belongs_to :purchase`

| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| postal_code        | string     | null: false |
| prefecture_id      | integer    | null: false |
| city               | string     | null: false |
| street_address     | string     | null: false |
| building_name      | string     |             |
| phone_number       | string     | null: false |
| purchase           | references | null: false, foreign_key: true |