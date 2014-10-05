require 'rails_helper'

RSpec.describe OpenStates, type: :model do
  describe "#legislators_by_district_search_string" do
    it "returns correct query string" do
      district = 1
      open_states = OpenStates.new
      result = open_states.legislators_by_district_search_string(1)
      expected = "legislators/?apikey=bfef33e0a83e4e98931765048ca24dd6&district=1&state=co"
      expect(result).to eq expected
    end
  end

  describe "#legislators_search_string" do
    it "returns correct query string" do
      open_states = OpenStates.new
      result = open_states.legislators_search_string
      expected = "legislators/?apikey=bfef33e0a83e4e98931765048ca24dd6&state=co"
      expect(result).to eq expected
    end
  end

  describe "#legislators_by_id_search_string" do
    it "returns correct query string" do
      open_states = OpenStates.new
      result = open_states.legislators_by_id_search_string("12345")
      expected = "legislators/12345/?apikey=bfef33e0a83e4e98931765048ca24dd6"
    end
  end

  describe "#connection" do
    it "returns a Faraday connection object" do
      result = OpenStates.new.connection
      expect(result.class).to eq Faraday::Connection
    end
  end
end
