class Bill < ActiveRecord::Base
  validates :external_id, presence: true
  has_many :votes
  has_many :actions

  def self.save_data_from_api(data = {})
    create! do |bill|
      bill.external_id = data["id"]
      bill.state = data["co"]
      bill.title = data["title"]
      bill.type = data["type"].first
      bill.external_updated_at = data["updated_at"].to_datetime
    end
  end
end
