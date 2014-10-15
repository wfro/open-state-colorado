namespace :api do
  desc "Retrieve all CO reps from Open States API"
  task legislators: :environment do
    open_states_api = OpenStates.new
    resp = open_states_api.get_legislators
    legislators = JSON.parse(resp.body)

    legislators.each do |legislator|
      filtered_attr = Legislator.filter_attributes(legislator)
      Legislator.create(filtered_attr)
    end
  end

  desc "Retrieve CO bills"
  task bills: :environment do
    open_states_api = OpenStates.new
    resp = open_states_api.get_bills
    bills = JSON.parse(resp.body)

    bills.each do |bill_data|
      Bill.save_data_from_api(bill_data)
    end
  end

end
