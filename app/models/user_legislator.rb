class UserLegislator < ActiveRecord::Base
  belongs_to :user
  belongs_to :legislator
end
