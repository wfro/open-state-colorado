class OpenStates
  BASE_URL = "http://openstates.org/api/v1/"
  API_KEY = ENV["open_states_api_key"]

  attr_reader :district

  def initialize(district)
    @district = district
  end

  def legislators_by_district_search_url
    "legislators/?" + {
      apikey: API_KEY,
      district: district,
      state: "co"
    }.to_query
  end

  def open_states_connection
    return Faraday.new(url: BASE_URL) do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end
  end
end
