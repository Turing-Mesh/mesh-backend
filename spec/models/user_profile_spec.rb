require 'rails_helper'

RSpec.describe UserProfile, type: :model do

  describe "relationships" do
    it { should belong_to :user }
  end

  describe "validations" do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :program }
    it { should validate_presence_of :current_mod }
    it { should define_enum_for :status }
  end

  describe "user_profile status" do
    it "user_profile can be enrolled" do
      user_profile = create(:user_profile, status: 0)
      expect(user_profile).to be_valid
      expect(user_profile.status).to eq("enrolled")
      expect(user_profile.status).to_not eq("graduated")
      expect(user_profile.status).to_not eq("withdrawn")
      expect(user_profile.status).to_not eq("on_leave")
    end

    it "user_profile can be graduated" do
      user_profile = create(:user_profile, status: 1)
      expect(user_profile).to be_valid
      expect(user_profile.status).to eq("graduated")
      expect(user_profile.status).to_not eq("enrolled")
      expect(user_profile.status).to_not eq("withdrawn")
      expect(user_profile.status).to_not eq("on_leave")
    end

    it "user_profile can be withdrawn" do
      user_profile = create(:user_profile, status: 2)
      expect(user_profile).to be_valid
      expect(user_profile.status).to eq("withdrawn")
      expect(user_profile.status).to_not eq("graduated")
      expect(user_profile.status).to_not eq("enrolled")
      expect(user_profile.status).to_not eq("on_leave")
    end

    it "user_profile can be on_leave" do
      user_profile = create(:user_profile, status: 3)
      expect(user_profile).to be_valid
      expect(user_profile.status).to eq("on_leave")
      expect(user_profile.status).to_not eq("enrolled")
      expect(user_profile.status).to_not eq("graduated")
      expect(user_profile.status).to_not eq("withdrawn")
    end
  end
end
