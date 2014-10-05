require 'rails_helper'

RSpec.describe OpenStates, type: :model do
  describe "#legislators_by_district_search_url" do
    it "returns an appropriate query string" do
      district = 1
      open_states = OpenStates.new(district)
      result = open_states.legislators_by_district_search_url
      expected = "legislators/?apikey=bfef33e0a83e4e98931765048ca24dd6&district=1&state=co"
      expect(result).to eq expected
    end
  end

  describe "#open_states_connection" do
    it "returns a Faraday connection object" do
      result = OpenStates.new(1).open_states_connection
      expect(result.class).to eq Faraday::Connection
    end
  end
end
