require 'rails_helper'

RSpec.describe 'Student projects request', type: :request do
  describe 'returns a students projects' do
    before :each do
      seed_test_db
    end
    describe 'happy path' do
      it "returns a single student's projects and feedback for matching mod when given valid data" do
        mod = 2

        get "/api/v1/students/#{@student.id}/student_projects?mod=#{mod}"

        json = JSON.parse(response.body, symbolize_names:true)

        expect(response).to be_successful
        expect(json).to be_a(Hash)
        expect(json[:data]).to be_a(Hash)
        check_hash_structure(json[:data], :id, String)
        check_hash_structure(json[:data], :type, String)
        expect(json[:data][:type]).to eq("projects")
        expect(json[:data][:attributes]).to be_a(Hash)
        check_hash_structure(json[:data][:attributes], :mod, String)
        check_hash_structure(json[:data][:attributes], :student_projects, Array)
        expect(json[:data][:attributes][:student_projects].count).to eq(2)
        check_hash_structure(json[:data][:attributes][:student_projects].first, :project_feedback, Array)
        expect(json[:data][:attributes][:student_projects].first[:project_feedback].count).to eq(5)
      end

      it "the projects response for valid request includes student project data" do
        mod = 2

        get "/api/v1/students/#{@student.id}/student_projects?mod=#{mod}"

        json = JSON.parse(response.body, symbolize_names:true)
        project = json[:data][:attributes][:student_projects].first

        check_hash_structure(project, :id, Integer)
        check_hash_structure(project, :name, String)
        check_hash_structure(project, :program, String)
        check_hash_structure(project, :project_number, String)
        check_hash_structure(project, :project_type, String)
        expect(project[:is_final_project]).to be_a(FalseClass).or be_a(TrueClass)
        check_hash_structure(project, :average_score, String)
        check_hash_structure(project, :instructor_comments, String)
        check_hash_structure(project, :student_comments, Array)
        expect(project[:student_comments]).to eq([@project_2.student_comments.split("/2C/")].to_a.flatten)
      end

      it "the projects response for a valid request includes project feedback data" do
        mod = 2

        get "/api/v1/students/#{@student.id}/student_projects?mod=#{mod}"

        json = JSON.parse(response.body, symbolize_names:true)
        feedback = json[:data][:attributes][:student_projects].first[:project_feedback].first

        check_hash_structure(feedback, :id, Integer)
        check_hash_structure(feedback, :rubric_category_name, String)
        check_hash_structure(feedback, :score, Float)
        expect(feedback[:comment]).to be_a(String).or be_nil
      end

      it "the projects response does not include projects for different mod" do
        mod = 2

        get "/api/v1/students/#{@student.id}/student_projects?mod=#{mod}"

        json = JSON.parse(response.body, symbolize_names:true)
        projects = json[:data][:attributes][:student_projects]

        expect(projects.count).to eq(2)
        expect(projects.first[:id]).to eq(@project_2.id)
        expect(projects.last[:id]).to eq(@project_3.id)
        expect(projects.include?(@project_1.id)).to eq(false)
      end
    end
  end

  describe 'sad path' do
    it "when no projects are found for current mod it returns an nil for student_projects" do
      student = create(:user, role: 0)
      student_profile = create(:user_profile, user_id: student.id, current_mod: "2", starting_cohort: "2011", current_cohort: "2011", status: 0)
      mod = 2

      get "/api/v1/students/#{student.id}/student_projects?mod=#{mod}"

      json = JSON.parse(response.body, symbolize_names:true)

      expect(response).to be_successful
      expect(json[:data][:attributes][:student_projects]).to be_nil
    end
  end

  describe 'edge cases' do
    it "returns an error when the student id is invalid" do
      mod = 2
      id = 201
      get "/api/v1/students/#{id}/student_projects?mod=#{mod}"

      expect(response).to_not be_successful
      json = JSON.parse(response.body, symbolize_names:true)

      expect(response.status).to eq(404)
      expect(json[:error]).to be_a(String)
      expect(json[:error]).to eq("Couldn't find User with 'id'=#{id}")
    end

    it "returns an error when the student id not an integer" do
      mod = 2
      id = 'id'
      get "/api/v1/students/#{id}/student_projects?mod=#{mod}"

      expect(response).to_not be_successful
      json = JSON.parse(response.body, symbolize_names:true)

      expect(response.status).to eq(400)
      expect(json[:error]).to be_a(String)
      expect(json[:error]).to eq("String not accepted as id")
    end

    it "returns an error when the mod parameter is missing" do
      student = create(:user, role: 0)
      student_profile = create(:user_profile, user_id: student.id, current_mod: "2", starting_cohort: "2011", current_cohort: "2011", status: 0)
      get "/api/v1/students/#{student.id}/student_projects"

      expect(response).to_not be_successful
      json = JSON.parse(response.body, symbolize_names:true)

      expect(response.status).to eq(400)
      expect(json[:error]).to be_a(String)
      expect(json[:error]).to eq("Required parameter missing")
    end

    it "returns an error when the mod parameter is blank" do
      student = create(:user, role: 0)
      student_profile = create(:user_profile, user_id: student.id, current_mod: "2", starting_cohort: "2011", current_cohort: "2011", status: 0)
      get "/api/v1/students/#{student.id}/student_projects?mod="

      expect(response).to_not be_successful
      json = JSON.parse(response.body, symbolize_names:true)

      expect(response.status).to eq(400)
      expect(json[:error]).to be_a(String)
      expect(json[:error]).to eq("Mod parameter is missing or invalid")
    end

    it "returns an error when mod parameter is a string" do
      student = create(:user, role: 0)
      student_profile = create(:user_profile, user_id: student.id, current_mod: "2", starting_cohort: "2011", current_cohort: "2011", status: 0)
      mod = "happy"
      get "/api/v1/students/#{student.id}/student_projects?mod=#{mod}"

      expect(response).to_not be_successful
      json = JSON.parse(response.body, symbolize_names:true)

      expect(response.status).to eq(400)
      expect(json[:error]).to be_a(String)
      expect(json[:error]).to eq("Mod parameter is missing or invalid")
    end

    it "returns an error when the mod parameter is not a value between 0-4" do
      student = create(:user, role: 0)
      student_profile = create(:user_profile, user_id: student.id, current_mod: "2", starting_cohort: "2011", current_cohort: "2011", status: 0)
      mod = 5
      get "/api/v1/students/#{student.id}/student_projects?mod=#{mod}"

      expect(response).to_not be_successful
      json = JSON.parse(response.body, symbolize_names:true)

      expect(response.status).to eq(400)
      expect(json[:error]).to be_a(String)
      expect(json[:error]).to eq("Mod parameter is missing or invalid")
    end
  end
end
