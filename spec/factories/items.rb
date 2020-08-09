FactoryBot.define do
  factory :item do
    user_id {1}
    images {Faker::Lorem.sentence}
    name {Faker::Lorem.sentence}
    description {Faker::Lorem.sentence}
    price {1000}
    category_id {2}
    status_id {2}
    shipping_charges_id {2}
    shipping_region_id {2}
    day_until_shipping_id {2}
  end
end
