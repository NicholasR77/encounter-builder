FactoryBot.define do
  factory :user do
    first_name { 'Test' }
    last_name { 'Testerson' }
    email { 'test1@test.com' }
    password { 'test1234' }
  end
end
