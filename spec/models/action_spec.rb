require 'rails_helper'

RSpec.describe Action, :type => :model do
  before do
    @action = FactoryGirl.create :action
  end

  subject { @action }

  it { should respond_to(:date) }
  it { should respond_to(:action) }
  it { should respond_to(:actor) }
  it { should be_valid }

  it { should belong_to(:bill) }
end

