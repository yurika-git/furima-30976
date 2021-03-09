class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :product
    validates :description
    validates :category_id
    validates :condition_id
    validates :charge_id
    validates :area_id 
    validates :shipping_id 
    validates :image
  end

  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

end
