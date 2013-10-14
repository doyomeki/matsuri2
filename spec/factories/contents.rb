# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :content do
    event_id 1
    booth_id 1
    title "MyString"
    description "MyString"
    start_at "2013-10-11 00:18:49"
    finish_at "2013-10-11 00:18:49"
    speaker_name "MyString"
    speaker_profile "MyString"
    speaker_image "MyString"
    deleted_at "2013-10-11 00:18:49"
  end
end
