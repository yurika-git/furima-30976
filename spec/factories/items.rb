FactoryBot.define do
  factory :item do
    product         {"商品"}
    description     {"あああああ"}
    category_id     {2}
    condition_id    {2}
    charge_id       {2}
    area_id         {2}
    shipping_id     {2}
    price           {300}
    association :user
    
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end