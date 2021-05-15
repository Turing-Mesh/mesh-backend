require 'rails_helper'

RSpec.describe InstructorStudent, type: :model do
  describe 'relationships' do
    it {should belong_to(:student).class_name('User')}
    it {should belong_to(:instructor).class_name('User')}
  end

  describe 'validations' do
    it "instructor cannot add themself as a student" do
      user = User.create!(email: 'haegonorious@email.com', password: 'password', role: :instructor)
      student = InstructorStudent.new(instructor_id: user.id, student_id: user.id)

      expect(student.save).to eq(false)
      expect(student.errors[:student_id].to_sentence).to eq('Instructor_id and student_id cannot be the same.')
    end
  end
end
