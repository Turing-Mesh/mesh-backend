require 'rails_helper'

RSpec.describe 'Instructor Project Rubric Request' do
  before :each do
    @student = create(:user, role: 0)
    @instructor = create(:user, role: 1)
    instructor_student = create(:instructor_student, instructor_id: @instructor.id, student_id: @student.id)
    student_profile = create(:user_profile, user_id: @student.id, current_mod: "2", starting_cohort: "2011", current_cohort: "2011", status: 0)
    instructor_profile = create(:user_profile, user_id: @instructor.id, current_mod: "2")
    # 2 rubric_templates, 1 for mod 1, and 1 for mod 2 projects
    mod1_rubric = create(:rubric_template)
    @mod2_rubric = create(:rubric_template)
    # 6 rubric categories
    testing = create(:rubric_category)
    oop = create(:rubric_category)
    code_quality = create(:rubric_category)
    completion = create(:rubric_category)
    active_record = create(:rubric_category)
    js = create(:rubric_category)
    # 9 rubric_template_categories (4 for mod 1, 5 for mod 2)
    mod1_rubric.rubric_categories << [testing, oop, code_quality, completion]
    @mod2_rubric.rubric_categories << [testing, oop, code_quality, completion, active_record]
    # 3 project templates, 1 for each project above
    project_template_1 = create(:project_template, mod: "1", project_number: "4", rubric_template_id: mod1_rubric.id)
    @project_template_2 = create(:project_template, mod: "2", project_number: "2", rubric_template_id: @mod2_rubric.id)
    project_template_3 = create(:project_template, mod: "2", project_number: "4", is_final: true, rubric_template_id: @mod2_rubric.id)
    project_template_4 = create(:project_template, mod: "3", project_number: "1", rubric_template_id: @mod2_rubric.id)
    # 3 projects, 1 for mod 1 and 2 for mod 2
    @project_1 = create(:student_project, student_id: @student.id, project_template_id: project_template_1.id)
    @project_2 = create(:student_project, student_id: @student.id, project_template_id: @project_template_2.id)
    @project_3 = create(:student_project, student_id: @student.id, project_template_id: project_template_3.id)
  end
  describe "happy path" do
    it "returns rubric categories for the given student, mod, and project number" do
      get "/api/v1/instructors/#{@instructor.id}/students/#{@student.id}/project_templates?mod=2&project_number=2"

      project_rubric = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(project_rubric).to have_key(:data)
      expect(project_rubric[:data]).to have_key(:id)
      expect(project_rubric[:data]).to have_key(:type)
      expect(project_rubric[:data][:attributes]).to have_key(:student_id)
      expect(project_rubric[:data][:attributes]).to have_key(:mod)
      expect(project_rubric[:data][:attributes]).to have_key(:project_number)
      expect(project_rubric[:data][:attributes]).to have_key(:rubric_template)
      expect(project_rubric[:data][:attributes][:mod]).to be_a String
      expect(project_rubric[:data][:attributes][:project_number]).to be_a String
      expect(project_rubric[:data][:attributes][:rubric_template]).to be_an Array
      expect(project_rubric[:data][:type]).to eq("project_rubric")
      expect(project_rubric[:data][:id].to_i).to eq(@project_template_2.id)
      expect(project_rubric[:data][:attributes][:rubric_template][0][:rubric_category_name]).to eq(@mod2_rubric.rubric_categories[0].name)
      expect(project_rubric[:data][:attributes][:rubric_template][1][:rubric_category_name]).to eq(@mod2_rubric.rubric_categories[1].name)
      expect(project_rubric[:data][:attributes][:rubric_template][2][:rubric_category_name]).to eq(@mod2_rubric.rubric_categories[2].name)
      expect(project_rubric[:data][:attributes][:rubric_template][3][:rubric_category_name]).to eq(@mod2_rubric.rubric_categories[3].name)
      expect(project_rubric[:data][:attributes][:rubric_template][4][:rubric_category_name]).to eq(@mod2_rubric.rubric_categories[4].name)
      expect(project_rubric[:data][:attributes][:student_id]).to eq(@student.id)
    end
  end
  describe "sad path" do
    it "needs project_number query parameter" do
      get "/api/v1/instructors/#{@instructor.id}/students/#{@student.id}/project_templates?mod=2"

      project_rubric = JSON.parse(response.body, symbolize_names: true)

      expect(project_rubric).to have_key(:message)
      expect(project_rubric).to have_key(:error)
      expect(project_rubric[:message]).to eq("your request cannot be completed")
      expect(project_rubric[:error]).to eq("Required parameter missing")
      expect(response.status).to eq(400)
    end

    it "needs mod query parameter" do
      get "/api/v1/instructors/#{@instructor.id}/students/#{@student.id}/project_templates?project_number=2"

      project_rubric = JSON.parse(response.body, symbolize_names: true)

      expect(project_rubric).to have_key(:message)
      expect(project_rubric).to have_key(:error)
      expect(project_rubric[:message]).to eq("your request cannot be completed")
      expect(project_rubric[:error]).to eq("Required parameter missing")
      expect(response.status).to eq(400)
    end

    it "project number parameter has to be a number in a string between 1 and 4" do
      get "/api/v1/instructors/#{@instructor.id}/students/#{@student.id}/project_templates?mod=2&project_number=-1"

      project_rubric = JSON.parse(response.body, symbolize_names: true)

      expect(project_rubric).to have_key(:message)
      expect(project_rubric).to have_key(:error)
      expect(project_rubric[:message]).to eq("your request cannot be completed")
      expect(project_rubric[:error]).to eq("Project Number parameter is missing or invalid")
      expect(response.status).to eq(400)
      get "/api/v1/instructors/#{@instructor.id}/students/#{@student.id}/project_templates?mod=2&project_number=5"
      project_rubric = JSON.parse(response.body, symbolize_names: true)
      expect(project_rubric).to have_key(:message)
      expect(project_rubric).to have_key(:error)
      expect(project_rubric[:message]).to eq("your request cannot be completed")
      expect(project_rubric[:error]).to eq("Project Number parameter is missing or invalid")
      expect(response.status).to eq(400)
    end

    it "mod parameter has to be a number in a string between 1 and 4" do
      get "/api/v1/instructors/#{@instructor.id}/students/#{@student.id}/project_templates?mod=-1&project_number=2"

      project_rubric = JSON.parse(response.body, symbolize_names: true)

      expect(project_rubric).to have_key(:message)
      expect(project_rubric).to have_key(:error)
      expect(project_rubric[:message]).to eq("your request cannot be completed")
      expect(project_rubric[:error]).to eq("Mod parameter is missing or invalid")
      expect(response.status).to eq(400)

      get "/api/v1/instructors/#{@instructor.id}/students/#{@student.id}/project_templates?mod=5&project_number=2"

      project_rubric = JSON.parse(response.body, symbolize_names: true)

      expect(project_rubric[:error]).to eq("Mod parameter is missing or invalid")
      expect(response.status).to eq(400)
    end

    it "instructor and student id must exists in our database" do
      id = 999999

      get "/api/v1/instructors/#{id}/students/#{@student.id}/project_templates?mod=2&project_number=2"

      project_rubric = JSON.parse(response.body, symbolize_names: true)

      expect(project_rubric).to have_key(:error)
      expect(project_rubric[:error]).to eq("Couldn't find User")
      expect(response.status).to eq(404)

      get "/api/v1/instructors/#{@instructor.id}/students/#{id}/project_templates?mod=2&project_number=2"

      project_rubric = JSON.parse(response.body, symbolize_names: true)

      expect(project_rubric).to have_key(:error)
      expect(project_rubric[:error]).to eq("Couldn't find User with 'id'=999999")
      expect(response.status).to eq(404)
    end

    it "mod 4 cannot have project number that is not equal to 1" do
      get "/api/v1/instructors/#{@instructor.id}/students/#{@student.id}/project_templates?mod=4&project_number=2"

      project_rubric = JSON.parse(response.body, symbolize_names: true)

      expect(project_rubric).to have_key(:error)
      expect(project_rubric[:error]).to eq("Invalid parameters, mod 4 only has project_number 1")
      expect(response.status).to eq(400)
    end
  end
end
