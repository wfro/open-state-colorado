require 'rails_helper'

RSpec.describe User, :type => :model do
  before do
    @user = User.new(name: "Example User", uid: "12345", provider: "facebook")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:provider) }
  it { should respond_to(:uid) }

  it { should be_valid }
end
