FactoryBot.define do
  factory :item do
    name              {"テスト"}
    description       {"テストテストテスト"}
    category_id       {"2"}
    status_id         {"2"}
    shipping_fee_id   {"2"}
    area_id           {"2"}
    delivery_day_id   {"2"}
    price             { 3980 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
