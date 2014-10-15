# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bill do
    external_id "12345"
    state "co"
    bill_type "resolution"
    title "Example Bill Title"
  end
end
