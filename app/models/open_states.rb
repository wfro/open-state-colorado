class OpenStates
  BASE_URL = "http://openstates.org/api/v1/"
  API_KEY = ENV["open_states_api_key"]

  def legislators_by_district_search_string(district)
    url = "legislators/?" + {
      apikey: API_KEY,
      district: district,
      state: "co"
    }.to_query
  end

  def legislators_search_string
    url = "legislators/?" + {
      apikey: API_KEY,
      state: "co"
    }.to_query
  end

  def legislators_by_id_search_string(id)
    url = "legislators/" + id + "/?apikey=#{API_KEY}"
  end

  def get_all_leg
    connection.get legislators_search_string
  end

  def connection
    return Faraday.new(url: BASE_URL) do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end
  end
end
