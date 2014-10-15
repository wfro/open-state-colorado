class OpenStates
  API_KEY = ENV["open_states_api_key"]

  def legislators_search_string
    "legislators/?" + {
      apikey: API_KEY,
      state: "co"
    }.to_query
  end

  def bills_search_string
    "bills/?" + {
      apikey: API_KEY,
      state: "co",
      updated_since: "2014-01-01",
      per_page: 20
    }.to_query
  end

  def lat_long_search_string(lat, long)
    "legislators/geo/?" + {
      apikey: API_KEY,
      lat: lat,
      long: long
    }.to_query
  end

  def bill_detail_search_string(external_id)
    "bills/" + external_id + "/?" + {
      apikey: API_KEY
    }.to_query
  end

  def geolocate_legislators(lat, long)
    connection.get(lat_long_search_string(lat, long))
  end

  def get_legislators
    connection.get(legislators_search_string)
  end

  def get_bills
    connection.get(bills_search_string)
  end

  def get_bill_detail(external_id)
    connection.get(bill_detail_search_string(external_id))
  end

  def connection
    return Faraday.new(url: "http://openstates.org/api/v1/") do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end
  end
end
