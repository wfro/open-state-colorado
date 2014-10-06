require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryGirl.build :user
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:provider) }
  it { should respond_to(:uid) }
  it { should respond_to(:district) }

  it { should be_valid }

  context "with a district not between 1 - 65" do
    it "should be invalid" do
      @user.district = "100"
      expect(@user).not_to be_valid
    end
  end

  context "with a non-numeric district" do
    it "should be invalid" do
      @user.district = "As4"
      expect(@user).not_to be_valid

      @user.district = "-40"
      expect(@user).not_to be_valid
    end
  end

  describe "#legislators" do
    it "returns scoped collection of legislators by district" do
      @user.district = "1"
      l1 = FactoryGirl.create :legislator, full_name: "John Doe", district: "1"
      l2 = FactoryGirl.create :legislator, full_name: "Jane Roe", district: "1"
      l3 = FactoryGirl.create :legislator, full_name: "DB Cooper", district: "2"

      expect(@user.legislators.count).to eq 2
      expect(@user.legislators[0].full_name).to eq "John Doe"
      expect(@user.legislators[1].full_name).to eq "Jane Roe"
    end
  end
end
