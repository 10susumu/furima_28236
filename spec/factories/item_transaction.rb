FactoryBot.define do
  factory :item_transaction do
    item_id { 1 }
    user_id { 1 }
    price { 2000 }
    postal_code { "123-4567" }
    prefectures_id { 2 }
    city {"東京都"}
    address_line1 { "1-1" }
    address_line2 {"東京ビル"}
    phone_number { "09012345678" }
  end
end
