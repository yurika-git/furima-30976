# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email           　 | string              | primary_key             |
| encrypted_password | string              | null: false             |
| surname          　| string              | null: false             |
| name       　　　   | string              | null: false             |
| surname_kana      　| string              | null: false             |
| name_kana          | string              | null: false             |
| birthday           | date                | null: false             |

### Association

* has_many :items
* has_many :records

## items table

| Column                 | Type       | Options           |
|------------------------|------------|-------------------|
| product                | string     | null: false       |
| description            | text       | null: false       |
| category_id            | integer　　  | null: false       |
| condition_id           | integer     | null: false       |
| charge_id              | integer    | null: false       |
| area_id                | integer     | null: false       |
| shipping_id            | integer    | null: false       |
| price                  | integer    | null: false       |
| user                   | references | foreign_key: true |
### Association

- belongs_to :user
- has_one :record
 
## records table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| item        | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addresses table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| zip_code           | string              | null: false             |
| area_id        　　 | integer             | null: false             |
| municipality       | string              | null: false             |
| house_number    　　| string         　   | null: false             |
| building_name      | string              | 　　　　　　　             |
| phone              | string              | null: false             |
| record             | references          | foreign_key: true       |

### Association

- belongs_to :record
