require 'rails_helper'

RSpec.describe Bill, :type => :model do
  before do
    @bill = Bill.new(open_states_id: "123456789")
  end

  subject { @bill }

  it { should respond_to(:open_states_id) }
  it { should be_valid }

  context "without valid open states id" do
    it "should be invalid" do
      @bill.open_states_id = nil
      expect(@bill).not_to be_valid
    end
  end
end
