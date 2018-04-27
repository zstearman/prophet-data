require 'rails_helper'

RSpec.describe User, type: :model do
  it "requires email to be present" do
    user = User.new(email: nil)
    expect(user).to_not be_valid
  end
end
