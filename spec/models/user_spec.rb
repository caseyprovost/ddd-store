require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it "requires a unique username" do
      FactoryBot.create(:user, username: "ironman")

      user = User.new(username: "ironman")
      expect(user.valid?).to be(false)
      expect(user.errors[:username]).to include("has already been taken")
    end

    it "requires a unique email" do
      FactoryBot.create(:user, email: "tony.stark@avengers.net")

      user = User.new(email: "tony.stark@avengers.net")
      expect(user.valid?).to be(false)
      expect(user.errors[:email]).to include("has already been taken")
    end
  end
end
