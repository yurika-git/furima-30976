class OrderAddress

  include ActiveModel::Model
  attr_accessor :zip_code, :area_id, :municipality, :house_number, :building_name, :phone, :order, :item, :user


with_options presence: true do
 validates :area_id
 validates :municipality
 validates :house_number
 validates :zip_code, format: { with: /\A\d{3}[-]\d{4}\z/} 
 validates :phone, format: { with: /\A\d{11}\z/} do
end


  def save
    Order.create(item_id: item, user_id: user)
    Address.create(zip_code: zip_code, area_id: area_id, municipality: municipality, house_number: house_number, building_name: building_name, phone: phone, order_id: order)
  end
end