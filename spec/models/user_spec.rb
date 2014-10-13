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
  it { should have_many(:legislators) }

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
end
