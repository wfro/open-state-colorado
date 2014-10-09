class Vote < ActiveRecord::Base
  has_many :yes_votes
  has_many :no_votes
  has_many :other_votes
  belongs_to :bill
end
