# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
  	name "MyString"
#    name { Forgery(:basic).text}
    title "MyString"
    body "MyText"
  end
end
