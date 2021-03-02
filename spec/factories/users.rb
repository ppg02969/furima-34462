FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {"拓也"}
    first_name            {"大西"}
    last_name_kana        {"オオニシ"}
    first_name_kana       {"タクヤ"}
    birthday              {'1992-08-11'}
  end
end