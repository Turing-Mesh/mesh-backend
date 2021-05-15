require 'rails_helper'

RSpec.describe User, type: :model do

  describe "validations" do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :role }
    it { should define_enum_for :role }
    it { should validate_presence_of :password}
    it { should have_secure_password }
  end

  describe "relationships" do
    it { should have_one :user_profile }
    it {should have_many(:projects).with_foreign_key(:student_id)}
    it {should have_many(:project_feedbacks).with_foreign_key(:instructor_id)}
    it {should have_many(:instructors).through(:instructor_users)}
    it {should have_many(:students).through(:student_users)}
  end

  describe "user roles" do
    it "user can be student user" do
      data = {email: "sample@email.com", password: "1234", role: 0}
      student_user = User.create(data)
      expect(student_user).to be_valid
      expect(student_user.role).to eq("student")
      expect(student_user.student?).to be_truthy
      expect(student_user.role).to_not eq("instructor")
    end

    it "user can be instructor user" do
      data = {email: "instructor_sample@email.com", password: "998877", role: 1}
      instructor_user = User.create(data)
      expect(instructor_user).to be_valid
      expect(instructor_user.role).to eq("instructor")
      expect(instructor_user.instructor?).to be_truthy
      expect(instructor_user.role).to_not eq("student")
    end
  end

  describe "user can be active or inactive" do
    it "user is active by default" do
      user = create(:user)
      expect(user).to be_valid
      expect(user.active).to eq(true)
      expect(user.active).to_not eq(false)
    end

    it "user can change active to false" do
      user = create(:user)
      expect(user.active).to eq(true)
      expect(user).to be_valid
      expect(user.active).to_not eq(false)
      user.update(active: false)
      expect(user.active).to eq(false)
      expect(user.active).to_not eq(true)
    end
  end

  describe 'email format validation' do
    it "creates a user with a valid email format" do
      user = User.create!(email: 'haegonorious@email.com', password: 'password', role: :student)

      expect(user.email).to eq('haegonorious@email.com')
    end

    it "should not create a user with a invalid email format" do
      user = User.new(email: 'bazzinni.email.com', password: 'password', role: :student)

      expect(user.save).to eq(false)
    end
  end
end
