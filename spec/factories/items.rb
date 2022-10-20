FactoryBot.define do
  factory :item do
    image                     {"2"}
    name                      {Faker::Name.initials(number: 5)}
    description               {Faker::Lorem.paragraph}
    category_id               {Category.ids[2]}
    state_id                  {State.ids[2]}
    delivery_charge_burden_id {DeliveryChargeBurden.ids[2]}
    prefecture_id             {Prefecture.ids[2]}
    delivery_day_id           {DeliveryDay.ids[2]}
    price                     {1500}
    association :user 
  end
end