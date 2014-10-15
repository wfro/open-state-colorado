class Bill < ActiveRecord::Base
  validates :external_id, presence: true
  has_many :votes
  has_many :actions

  def self.save_data_from_api(data = {})
    find_or_create_by(external_id: data["id"]) do |bill|
      bill.external_id = data["id"]
      bill.state = data["co"]
      bill.title = data["title"]
      bill.bill_type = data["type"].first
      bill.external_updated_at = data["updated_at"].to_datetime
    end
  end
end
