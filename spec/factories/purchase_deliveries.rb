FactoryBot.define do
  factory :purchase_delivery do
    token          {"tok_abcdefghijk00000000000000000"}
    postcode       {'123-4567'}
    prefecture_id  {2}
    city           {'杉並区'}
    block          {'杉並1-1'}
    building       {'東京ハイツ203'}
    phone_number   {"08012345678"}
  end
end
