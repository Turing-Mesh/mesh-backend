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
    before :each do
      @user = create(:user)
    end
    it "user_profile can be enrolled" do
      user_profile = create(:user_profile, status: 0, user_id: @user.id)
      expect(user_profile).to be_valid
      expect(user_profile.status).to eq("enrolled")
      expect(user_profile.status).to_not eq("graduated")
      expect(user_profile.status).to_not eq("withdrawn")
      expect(user_profile.status).to_not eq("on_leave")
    end

    it "user_profile can be graduated" do
      user_profile = create(:user_profile, status: 1, user_id: @user.id)
      expect(user_profile).to be_valid
      expect(user_profile.status).to eq("graduated")
      expect(user_profile.status).to_not eq("enrolled")
      expect(user_profile.status).to_not eq("withdrawn")
      expect(user_profile.status).to_not eq("on_leave")
    end

    it "user_profile can be withdrawn" do
      user_profile = create(:user_profile, status: 2, user_id: @user.id)
      expect(user_profile).to be_valid
      expect(user_profile.status).to eq("withdrawn")
      expect(user_profile.status).to_not eq("graduated")
      expect(user_profile.status).to_not eq("enrolled")
      expect(user_profile.status).to_not eq("on_leave")
    end

    it "user_profile can be on_leave" do
      user_profile = create(:user_profile, status: 3, user_id: @user.id)
      expect(user_profile).to be_valid
      expect(user_profile.status).to eq("on_leave")
      expect(user_profile.status).to_not eq("enrolled")
      expect(user_profile.status).to_not eq("graduated")
      expect(user_profile.status).to_not eq("withdrawn")
    end
  end

  describe "instance methods" do
    it "find_students" do
      instructor = User.create!(email: 'haegonorious@email.com', password: 'password', role: :instructor)
      student = User.create!(email: 'bazzinni@email.com', password: 'password', role: :student)
  
      instructor_student = create(:instructor_student, instructor_id: instructor.id, student_id: student.id)
      student_profile = create(:user_profile, user_id: student.id, current_mod: "2", starting_cohort: "2010", current_cohort: "2010", status: 0)
      instructor_profile = create(:user_profile, user_id: instructor.id, current_mod: "2")

      actual = instructor_profile.find_students(student_profile.first_name,student_profile.last_name)
      expect(actual.first.class).to eq UserProfile
      expect(actual.first.first_name).to eq student_profile.first_name
    end
  end
end
