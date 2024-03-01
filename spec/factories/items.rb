FactoryBot.define do
  factory :item do
    title               {Faker::Commerce}
    content             {Faker::Lorem}
    category_id         {Faker::Number.between(from: 2, to: 11)}
    preservation_id     {Faker::Number.between(from: 2, to: 7)}
    delivery_charge_id  {Faker::Number.between(from: 2, to: 3)}
    prefecture_id       {Faker::Number.between(from: 2, to: 48)}
    delivery_time_id    {Faker::Number.between(from: 2, to: 4)}
    amount              {Faker::Number.between(from: 300, to: 9999999)}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
