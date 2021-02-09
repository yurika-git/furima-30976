# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email           　 | string              | primary_key             |
| password           | string              | null: false             |
| name             　| string              | null: false             |
| kana       　　　   | string              | null: false             |
| birthday           | datetime            | null: false             |

### Association

* has_many :items
* has_many :records

## items table

| Column                 | Type       | Options           |
|------------------------|------------|-------------------|
| product                | string     | null: false       |
| description            | text       | null: false       |
| category               | string　　  | null: false       |
| condition              | string     | null: false       |
| charge                 | boolean    | null: false       |
| area                   | string     | null: false       |
| shipping               | integer    | null: false       |
| price                  | integer    | null: false       |
| user                   | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :record

## records table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| item_id     | references | foreign_key: true |
| user_id     | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## address table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| zipcode            | integer             | null: false             |
| prefecture     　　 | string              | null: false             |
| municipality       | string              | null: false             |
| house_number    　　| integer             | null: false             |
| buildingname       | string              | null: false             |
| phone              |  integer            | null: false             |
| record             | references          | foreign_key: true       |

### Association

- belongs_to :record
