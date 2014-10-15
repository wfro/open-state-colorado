require 'rails_helper'

RSpec.describe Bill, :type => :model do
  before do
    @bill = FactoryGirl.create :bill
  end

  subject { @bill }

  it { should respond_to(:external_id) }
  it { should respond_to(:state) }
  it { should respond_to(:title) }
  it { should respond_to(:bill_type) }
  it { should respond_to(:external_updated_at) }
  it { should be_valid }

  it { should have_many(:votes) }

  context "without valid open states id" do
    it "should be invalid" do
      @bill.external_id = nil
      expect(@bill).not_to be_valid
    end
  end
end
