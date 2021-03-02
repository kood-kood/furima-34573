hist# テーブル設計

## usersテーブル

Things you may want to cover:
| Column             | Type     | Options     |
| -----------------  | -------- | ----------- |
| email              | string   | null: false, unique: true|
| encrypted_password | string   | null: false |
| nickname           | string   | null: false |
| birthday           | date     | null: false |
| last_name          | string   | null: false |
| given_names        | string   | null: false |
| last_name_furigana | string   | null: false |
| given_names_furigana | string   | null: false |

### Association
- has_many :items
- has_many :histories

## itemsテーブル

* Database initialization
| Column               | Type     | Options     |
| -------------------- | -------- | ----------- |
| product_name         | string   | null: false, foreign_key: true |
| price                | integer  | null: false |
| description          | text     | null: false |
| product_condition_id | integer  | null: false | 
| shipping_charge_id   | integer  | null: false |
| shipping_rea_id      | integer  | null: false |
| days_to_ship_id      | integer  | null: false |
| category_id          | integer  | null: false |

### Association
- belongs_to :user
- has_one :history

## historiesテーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| buy       | references | null: false, foreign_key: true |
| payment   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :domicile

## domicilesテーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| address          | string     | null: false |
| phone_number     | string     | null: false |
| postal_code      | string     | null: false |
| prefecture_id    | references | null: false, foreign_key: true |
| municipality     | string     | null: false |
| building_name    | string     |

## Association
- belongs_to :history

## messagesテーブル
| Column    | Type           | Options                        |
| --------- | -------------- | ------------------------------ |
| comment   | string         |
| user      | references     | null: false, foreign_key: true |
| item      | references     | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

