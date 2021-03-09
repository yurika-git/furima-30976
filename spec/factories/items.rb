FactoryBot.define do
  factory :item do
    product         {"商品"}
    description     {"あああああ"}
    category_id     {1}
    condition_id    {1}
    charge_id       {1}
    area_id         {1}
    shipping_id     {1}
    price           {300}
    association :user
    
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end