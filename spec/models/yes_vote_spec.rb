require 'rails_helper'

RSpec.describe YesVote, :type => :model do
  before do
    @yes_vote = FactoryGirl.create :yes_vote
  end

  subject { @yes_vote }

  it { should respond_to(:leg_id) }
  it { should respond_to(:vote_id) }
  it { should be_valid }
end
