# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    user_id 1
    name "MyString"
    body "MyText"
    auth "MyString"
  end
end
