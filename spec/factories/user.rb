FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    last_name { gimei.last.kanji }
    first_name { gimei.first.kanji }
    last_name_reading { gimei.last.katakana }
    first_name_reading { gimei.first.katakana }
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    birthday { '1990/10/10' }
  end
end
