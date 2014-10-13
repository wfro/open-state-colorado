class Legislator < ActiveRecord::Base
  scope :district, ->(id) { where(:district => id.to_s)}

  def self.filter_attributes(data = {})
    attributes = %w[external_id district party email photo_url url full_name]
    data.select do |key, value|
      attributes.include?(key)
    end
  end
end
