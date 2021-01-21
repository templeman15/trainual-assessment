FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    sequence(:email) { |i| "#{i}#{Faker::Internet.email}" }
    phone { Faker::PhoneNumber.cell_phone }
  end
end
