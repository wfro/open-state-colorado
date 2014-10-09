class Bill < ActiveRecord::Base
  validates :external_id, presence: true
  has_many :votes
end
