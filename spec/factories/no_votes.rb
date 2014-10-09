# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :no_vote do
    leg_id "12345"
    vote
  end
end
