require 'rails_helper'

describe 'Instructor Students request' do
  before :each do
    @instructor = create(:user, role: 1)
    student_1 = create(:user, role: 0)
    student_2 = create(:user, role: 0)
    @student_3 = create(:user, role: 0)

    instructor_student_1 = create(:instructor_student, instructor_id: @instructor.id, student_id: student_1.id)
    instructor_student_2 = create(:instructor_student, instructor_id: @instructor.id, student_id: student_2.id)
    instructor_student_3 = create(:instructor_student, instructor_id: @instructor.id, student_id: @student_3.id)
    student_1_profile = create(:user_profile, user_id: student_1.id, current_mod: "2", starting_cohort: "2011", current_cohort: "2011", status: 0)
    student_2_profile = create(:user_profile, user_id: student_2.id, current_mod: "2", starting_cohort: "2011", current_cohort: "2011", status: 0)
    student_3_profile = create(:user_profile, user_id: @student_3.id, current_mod: "3", starting_cohort: "2010", current_cohort: "2010", status: 0)
    instructor_profile = create(:user_profile, user_id: @instructor.id, current_mod: "2")
  end
  describe 'happy path' do
    it "returns information about the students under an instructor" do
      get "/api/v1/instructors/#{@instructor.id}/instructor_students?mod=2"
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:data].class).to eq Array
      expect(json[:data].first[:type]).to eq "student"
      expect(json[:data].first[:attributes].keys).to eq %i(user_id first_name last_name current_cohort)
    end

    it "returns only the students in the specified mod" do
      get "/api/v1/instructors/#{@instructor.id}/instructor_students?mod=2"
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:data].none?{ |student| student[:attributes][:first_name] == @student_3.user_profile.first_name }).to eq true
    end


  end

  describe 'sad path' do
    it "should return bad data for missing query parameters" do
      get "/api/v1/instructors/#{@instructor.id}/instructor_students"
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:data]).to eq "Invalid Query Parameters"
    end

    it "should be given a correct instructor id" do
      get "/api/v1/instructors/99999/instructor_students?mod=2"
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:error]).to eq "Couldn't find User with 'id'=99999"
    end
  end
end
