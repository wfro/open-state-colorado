require 'rails_helper'

RSpec.describe NoVote, :type => :model do
  before do
    @no_vote = FactoryGirl.create :no_vote
  end

  subject { @no_vote }

  it { should respond_to(:leg_id) }
  it { should respond_to(:vote_id) }
  it { should be_valid }
end
