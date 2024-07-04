FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    street_address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
  end
end
