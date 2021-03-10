class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to_active_hash :category
  belongs_to_active_hash :charge
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping

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

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :charge_id
    validates :area_id
    validates :shipping_id
  end

  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

end
