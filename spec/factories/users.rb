FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation {password}
    first_name            {"太郎"}
    last_name             {"鈴木"}
    first_name_kana       {"タロウ"}
    last_name_kana        {"スズキ"}
    birth_date            {Faker::Date.between(from: '1930-01-01', to: '2017-12-31')}
  end
end