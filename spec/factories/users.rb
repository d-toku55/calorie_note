FactoryBot.define do
  factory :user do
    nickname              { 'abe' }
    gender                { '0' }
    email                 { Faker::Internet.free_email }
    password              { '123abc' }
    encrypted_password    { password }
  end
end