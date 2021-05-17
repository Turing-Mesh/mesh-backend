require 'rails_helper'

describe 'Instructor Students request' do
  describe 'gets an instructors students' do
    it "returns a single student's projects and feedback for matching mod when given valid data" do
      instructor = create(:user, role: 1)
      student_1 = create(:user, role: 0)
      student_2 = create(:user, role: 0)

      instructor_student_1 = create(:instructor_student, instructor_id: instructor.id, student_id: student_1.id)
      instructor_student_2 = create(:instructor_student, instructor_id: instructor.id, student_id: student_2.id)
      student_1_profile = create(:user_profile, user_id: student_1.id, current_mod: "2", starting_cohort: "2011", current_cohort: "2011", status: 0)
      student_2_profile = create(:user_profile, user_id: student_2.id, current_mod: "2", starting_cohort: "2011", current_cohort: "2011", status: 0)
      instructor_profile = create(:user_profile, user_id: instructor.id, current_mod: "2")

      get "/api/v1/instructors/#{instructor.id}/instructor_students?mod=2"
      response = JSON.parse(response.body, symbolize_names: true)

      expect(response[:data].class).to eq Array
      expect(response[:data].first[:type]).to eq "student"
    end
  end
end
