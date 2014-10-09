# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vote do
    bill_id "12345"
    motion "motion"
    chamber "upper"
    date "1/1/2014"
    external_id "67890"
    yes_count "10"
    no_count "5"
    other_count "5"
  end
end
