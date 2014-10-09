class OpenStates
  API_KEY = ENV["open_states_api_key"]

  def legislators_search_string
    "legislators/?" + {
      apikey: API_KEY,
      state: "co"
    }.to_query
  end

  # Probably not necessary to go super far back, starting with 2014 for now.
  # Give this a better name to illustrate that
  def bills_search_string
    "bills/?" + {
      apikey: API_KEY,
      state: "co",
      updated_since: "2014-01-01"
    }.to_query
  end

  def get_legislators
    connection.get(legislators_search_string)
  end

  def get_bills
    connection.get(bills_search_string)
  end

  def connection
    return Faraday.new(url: "http://openstates.org/api/v1/") do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end
  end
end
