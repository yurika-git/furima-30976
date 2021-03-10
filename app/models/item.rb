class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :product
    validates :description
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :charge_id, numericality: { other_than: 1 }
    validates :area_id, numericality: { other_than: 1 }
    validates :shipping_id, numericality: { other_than: 1 } 
    validates :image
  end

  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

end
