class Vote < ActiveRecord::Base
  has_many :yes_votes
  has_many :no_votes
  has_many :other_votes
  belongs_to :bill

  def self.save_data_from_api(data = {}, bill_id)
    find_or_create_by(external_id: data["id"]) do |vote|
      vote.motion      = data["motion"]
      vote.chamber     = data["chamber"]
      vote.date        = data["date"]
      vote.external_id = data["id"]
      vote.yes_count   = data["yes_count"]
      vote.no_count    = data["no_count"]
      vote.other_count = data["other_count"]
      vote.bill_id     = bill_id
    end
  end

  def find_legislators_vote(leg_id)
    no = no_votes.detect { |no_vote| no_vote.leg_id == leg_id }
    yes = yes_votes.detect { |yes_vote| yes_vote.leg_id == leg_id }
    other = other_votes.detect { |other_vote| other_vote.leg_id == leg_id }

    return "no" if no
    return "yes" if yes
    return "other" if other
  end
end
