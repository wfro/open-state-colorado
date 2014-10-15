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
end
