class Bill < ActiveRecord::Base
  validates :open_states_id, presence: true
end
