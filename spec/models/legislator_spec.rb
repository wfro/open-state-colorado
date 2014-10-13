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

  describe ".filter_attributes" do
    it "returns a hash filtered to only necessary cols from legislators table" do
      initial_data = {"leg_id" => "12345", "district" => "1", "party" => "donkeys",
                      "email" => "johndoe@example.com", "photo_url" => "", "url" => "",
                      "full_name" => "John Doe", "chamber" => "upper"}
      filtered = Legislator.filter_attributes(initial_data)
      expected_attr = %w[district party email photo_url url full_name external_id]

      expect(filtered.keys).to eq expected_attr
      expect(filtered.keys).not_to include "chamber"
    end
  end

end
