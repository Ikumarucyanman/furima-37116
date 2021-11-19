<!-- users テーブル -->

| Column                | Type    | Options                   |
| --------------------- | ------- | ------------------------- |
| nickname              | string  | null: false, unique: true |
| email                 | string  | null: false               |
| password              | string  | null: false               |
| password_confirmation | string  | null: false               |
| last_name             | string  | null: false               |
| first_name            | string  | null: false               |
| last_name_kana        | string  | null: false               |
| first_name_kana       | string  | null: false               |
| year_of_birth         | integer | null: false               |
| month_of_birth        | integer | null: false               |
| day_of_birth          | integer | null: false               |

<!-- Association -->

- has_many :items
- has_many :orders
- has_one :shippings

<!-- items テーブル -->

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| explanation         | text       | null: false                    |
| category            | text       | null: false                    |
| sales_status        | text       | null: false                    |
| shipping_fee_status | text       | null: false                    |
| prefecture          | text       | null: false                    |
| scheduled           | string     | null: false                    |
| price               | integer    | null: false                    |
| comment             | text       | null: false                    |
| user                | references | null: false, foreign_key: true |

<!-- Association -->

- belongs_to :user
- has_many :orders

<!-- orders テーブル -->

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

<!-- Association -->

- belongs_to :user
- belongs_to :item

<!-- shippings テーブル -->

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | integer    | null: false                    |
| prefecture   | text       | null: false                    |
| city         | text       | null: false                    |
| addresses    | string     | null: false                    |
| building     | text       | null: false                    |
| phone_number | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

<!-- Association -->

- belongs_to :user