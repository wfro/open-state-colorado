require 'rails_helper'

RSpec.describe OpenStates, type: :model do
  let(:open_states) { OpenStates.new }

  describe "#legislators_search_string" do
    it "returns correct query string" do
      result = open_states.legislators_search_string
      expected = "legislators/?apikey=#{ENV['open_states_api_key']}&state=co"
      expect(result).to eq expected
    end
  end

  describe "#bills_search_string" do
    it "returns correct query string for bills starting in 2014" do
      result = open_states.bills_search_string
      expected = "bills/?apikey=#{ENV['open_states_api_key']}&state=co&updated_since=2014-01-01"
      expect(result).to eq expected
    end
  end

  describe "#lat_long_search_string" do
    it "returns correcty query string" do
       lat = "35.1"
       long = "-100.5"
       result = open_states.lat_long_search_string(lat, long)
       expected = "legislators/geo/?apikey=bfef33e0a83e4e98931765048ca24dd6&lat=35.1&long=-100.5"
    end
  end

  describe "#connection" do
    it "returns a Faraday connection object" do
      result = OpenStates.new.connection
      expect(result.class).to eq Faraday::Connection
    end
  end
end
