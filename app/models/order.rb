class Order < ApplicationRecord
  belongs_to :user, :item
  validates :price, presence: true
end
