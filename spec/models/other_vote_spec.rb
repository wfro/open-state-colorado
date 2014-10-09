require 'rails_helper'

RSpec.describe OtherVote, :type => :model do
  before do
    @other_vote = FactoryGirl.create :other_vote
  end

  subject { @other_vote }

  it { should respond_to(:leg_id) }
  it { should respond_to(:vote_id) }
  it { should be_valid }
end
