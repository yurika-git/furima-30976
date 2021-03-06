class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :product
    validates :description
    validates :category_id
    validates :condition_ide
    validates :charge_id
    validates :area_id 
    validates :shipping_id
    validates :price 
  end
end
