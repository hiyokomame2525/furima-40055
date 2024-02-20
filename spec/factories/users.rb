FactoryBot.define do
  factory :user do
    nickname                      { Faker::Name.name }
    email                         { Faker::Internet.email }
    password                      { Faker::Internet.password(min_length: 6) }
    password_confirmation         { password }
    last_name                     { "やマ田" }
    first_name                    { "太ロう" }
    last_pronunciation            { "ヤマダ" }
    first_pronunciation           { "タロウ" }
    birthday                      { Faker::Date.between(from: "1930-01-01",to: "2019-12-31") }
  end
end