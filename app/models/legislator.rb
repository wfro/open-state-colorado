class Legislator < ActiveRecord::Base
  scope :district, ->(id) { where(:district => id.to_s)}

  def self.save_data_from_api(data = {})
    create! do |legislator|
      legislator.open_states_id = data["leg_id"]
      legislator.district = data["district"]
      legislator.party = data["party"]
      legislator.email = data["email"]
      legislator.url = data["url"]
      legislator.full_name = data["full_name"]
    end
  end
end
