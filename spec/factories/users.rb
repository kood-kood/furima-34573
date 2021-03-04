FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'長島'}
    given_names           {'幸司'}
    last_name_furigana    {'ナガシマ'}
    given_names_furigana  {'コウジ'}
    birthday              {'2011-11-11'}
  end
end
