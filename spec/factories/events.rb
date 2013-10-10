# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    title "MyString"
    description "MyText"
    capacity 1
    place "MyString"
    start_datetime "2013-10-10 20:22:39"
    end_datetime "2013-10-10 20:22:39"
    deleted_at "2013-10-10 20:22:39"
  end
end
