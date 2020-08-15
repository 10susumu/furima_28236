FactoryBot.define do
  factory :user do
    tentative_name = Gimei.name
    last_name { tentative_name.last.kanji }
    first_name { tentative_name.first.kanji }
    last_name_reading { tentative_name.last.katakana }
    first_name_reading { tentative_name.first.katakana }
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    birthday { '1990/10/10' }
  end
end
