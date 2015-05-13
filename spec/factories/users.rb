FactoryGirl.define do
  factory :user do
    sequence(:first_name)   { |n| "User#{n}"}
    last_name               'Townhall'
    sequence(:email)        { |n| "user-#{n}@example.com"}
    password                '123123123'
    birth_year              '1990'
    gender                  :male
  end
end