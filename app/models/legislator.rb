class Legislator < ActiveRecord::Base
  scope :district, ->(id) { where(:district => id.to_s)}

  def self.filter_attributes(data = {})
    attributes = %w[district party email photo_url url full_name]
    filtered = data.select { |key, value| attributes.include?(key) }

    # The local 'external_id' field is named 'leg_id' when it comes
    # back from the Open States API
    filtered["external_id"] = data["leg_id"]

    return filtered
  end
end
