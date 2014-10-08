class Bill < ActiveRecord::Base
  validates :external_id, presence: true
end
