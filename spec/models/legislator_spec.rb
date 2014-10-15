require 'rails_helper'

RSpec.describe Legislator, :type => :model do
  before do
    @legislator = Legislator.create(external_id: "12345",
                                    district: "1",
                                    party: "democrat",
                                    email: "legislator@example.gov",
                                    photo_url: "http://examplephotourl.com",
                                    url: "http://government.gov",
                                    full_name: "John Doe")
  end

  subject { @legislator }

  it { should respond_to(:external_id) }
  it { should respond_to(:district) }
  it { should respond_to(:party) }
  it { should respond_to(:email) }
  it { should respond_to(:photo_url) }
  it { should respond_to(:url) }
  it { should respond_to(:full_name) }
  it { should be_valid }
end
