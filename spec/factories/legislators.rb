FactoryGirl.define do
  factory :legislator do
    open_states_id "12345"
    district "1"
    party "democrat"
    email "john.doe@example.gov"
    photo_url "http://example.gov/images/1"
    url "http://example.gov"
    full_name "John Doe"
  end
end
