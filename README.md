# テーブル設計

## usersテーブル

Things you may want to cover:
| Column             | Type     | Options     |
| -----------------  | -------- | ----------- |
| email              | string   | null: false, unique: true|
| encrypted_password | string   | null: false |
| nickname           | string   | null: false |
| name               | string   | null: false |
| birthday           | date     | null: false |
| Last name          | string   | null: false |
| given names        | string   | null: false |
| last name furigana | string   | null: false |
| given names furigana | string   | null: false |

### Association
- has_many :items
- has_one :orders

## itemsテーブル

* Database initialization
| Column       | Type     | Options     |
| ------------ | -------- | ----------- |
| product name | string   | null: false |
| category_id  | integer  | null: false |
| price        | integer  | null: false |
| seller_id    | integer  | null: false |
| description  | text     | null: false |
| details_id   | integer  | null: false |
| delivery_id  | integer  | null: false |

### Association
- has_many :users
- has_one :orders

## historysテーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| buy       | text       | null: false |
| payment   | references | null: false |

### Association
- belongs_to :users
- belongs_to :items
- has_one :domiciles

## domicilesテーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| street address   | text       | null: false |
| delivery method  | text       | null: false |
| phone number     | text       | null: false |

## Association
- belongs_to :orders