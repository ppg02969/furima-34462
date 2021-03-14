FactoryBot.define do
  factory :buyer do
    postal_code { '123-4567' }
    area_id { 2 }
    municipality { 'テスト市' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
    association :order
  end
end
