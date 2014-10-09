require 'rails_helper'

RSpec.describe Vote, :type => :model do
  before do
    @vote = FactoryGirl.create :vote
  end

  subject { @vote }

  it { should respond_to(:bill_id) }
  it { should respond_to(:motion) }
  it { should respond_to(:chamber) }
  it { should respond_to(:date) }
  it { should respond_to(:yes_count) }
  it { should respond_to(:no_count) }
  it { should respond_to(:other_count) }
  it { should respond_to(:external_id) }
  it { should be_valid }
end
