FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.email }
    password              { "#{Faker::Internet.password(min_length: 6)}1a" }
    password_confirmation { password }
    last_name             { Faker::Japanese::Name.last_name }
    first_name            { Faker::Japanese::Name.first_name }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'リクタロウ' }
    birth_date            { Faker::Date.birthday }
  end
end
