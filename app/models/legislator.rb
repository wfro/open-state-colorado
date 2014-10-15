class Legislator < ActiveRecord::Base
  scope :district, ->(id) { where(:district => id.to_s)}

  has_many :user_legislators
  has_many :users, through: :user_legislators

  def self.save_data_from_api(data = {})
    find_or_create_by(external_id: data["leg_id"]) do |legislator|
      legislator.external_id = data["leg_id"]
      legislator.district = data["district"]
      legislator.party = data["party"]
      legislator.email = data["email"]
      legislator.photo_url = data["photo_url"]
      legislator.url = data["url"]
      legislator.full_name = data["full_name"]
    end
  end
end
