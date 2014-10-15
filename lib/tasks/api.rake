namespace :api do
  desc "Retrieve all CO reps from Open States API"
  task legislators: :environment do
    open_states_api = OpenStates.new
    response = open_states_api.get_legislators
    legislators = JSON.parse(response.body)

    legislators.each do |legislator|
      Legislator.save_data_from_api(legislator)
    end
  end

  desc "Retrieve CO bills"
  task bills: :environment do
    open_states_api = OpenStates.new
    response = open_states_api.get_bills
    bills = JSON.parse(response.body)

    bills.each do |bill_data|
      bill = Bill.save_data_from_api(bill_data)
      response = open_states_api.get_bill_detail(bill.external_id)
      bill_detail = JSON.parse(response.body)
      votes = bill_detail["votes"]

      votes.each do |vote_data|
        yes_votes = vote_data["yes_votes"]
        no_votes = vote_data["no_votes"]
        other_votes = vote_data["other_votes"]
        vote = Vote.save_data_from_api(vote_data, bill.id)

        yes_votes.each do |yes_vote|
          YesVote.create(leg_id: yes_vote["leg_id"], vote_id: vote.id)
        end

        no_votes.each do |no_vote|
          NoVote.create(leg_id: no_vote["leg_id"], vote_id: vote.id)
        end

        other_votes.each do |other_vote|
          OtherVote.create(leg_id: other_vote["leg_id"], vote_id: vote.id)
        end
      end
    end
  end
end
