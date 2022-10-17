FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation {password}
    first_name            {"鈴木"}
    last_name             {"太郎"}
    first_name_kana       {"スズキ"}
    last_name_kana        {"タロウ"}
    birth_date            {Faker::Date.between(from: '1930-01-01', to: '2017-12-31')}
  end
end