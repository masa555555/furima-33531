
FactoryBot.define do
  factory :item do
    
    name {"furima"}
    description {"商品の説明です"}
    price {33333}
    preparation_day_id {2}
    item_condition_id {2}
    category_id {2}
    shipping_fee_id{2}
    prefecture_id{2}

    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
