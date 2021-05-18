require 'rails_helper'

describe 'Student projects request' do
  describe 'happy path' do
    before :each do
      @student = create(:user, role: 0)
      @instructor = create(:user, role: 1)
      instructor_student = create(:instructor_student, instructor_id: @instructor.id, student_id: @student.id)
      student_profile = create(:user_profile, user_id: @student.id, current_mod: "2", starting_cohort: "2011", current_cohort: "2011", status: 0)
      instructor_profile = create(:user_profile, user_id: @instructor.id, current_mod: "2")
      # 2 rubric_templates, 1 for mod 1, and 1 for mod 2 projects
      mod1_rubric = create(:rubric_template)
      mod2_rubric = create(:rubric_template)
      # 6 rubric categories
      testing = create(:rubric_category)
      oop = create(:rubric_category)
      code_quality = create(:rubric_category)
      completion = create(:rubric_category)
      active_record = create(:rubric_category)
      js = create(:rubric_category)
      # 9 rubric_template_categories (4 for mod 1, 5 for mod 2)
      mod1_rubric.rubric_categories << [testing, oop, code_quality, completion]
      mod2_rubric.rubric_categories << [testing, oop, code_quality, completion, active_record]
      # 3 project templates, 1 for each project above
      project_template_1 = create(:project_template, mod: "1", project_number: "4", rubric_template_id: mod1_rubric.id)
      project_template_2 = create(:project_template, mod: "2", project_number: "3", rubric_template_id: mod2_rubric.id)
      project_template_3 = create(:project_template, mod: "2", project_number: "4", is_final: true, rubric_template_id: mod2_rubric.id)
      project_template_4 = create(:project_template, mod: "3", project_number: "1", rubric_template_id: mod2_rubric.id)
      # 3 projects, 1 for mod 1 and 2 for mod 2
      @project_1 = create(:student_project, student_id: @student.id, project_template_id: project_template_1.id)
      @project_2 = create(:student_project, student_id: @student.id, project_template_id: project_template_2.id)
      @project_3 = create(:student_project, student_id: @student.id, project_template_id: project_template_3.id)
      # 14 project feedback (4 for mod 1 project, 5 for mod 2)
      feedback_1 = create(:project_feedback, instructor_id: @instructor.id, project_id: @project_1.id, rubric_template_category_id: mod1_rubric.rubric_template_categories[0].id)
      feedback_2 = create(:project_feedback, instructor_id: @instructor.id, project_id: @project_1.id, rubric_template_category_id: mod1_rubric.rubric_template_categories[1].id)
      feedback_3 = create(:project_feedback, instructor_id: @instructor.id, project_id: @project_1.id, rubric_template_category_id: mod1_rubric.rubric_template_categories[2].id)
      feedback_4 = create(:project_feedback, instructor_id: @instructor.id, project_id: @project_1.id, rubric_template_category_id: mod1_rubric.rubric_template_categories[3].id)
      feedback_5 = create(:project_feedback, instructor_id: @instructor.id, project_id: @project_2.id, rubric_template_category_id: mod2_rubric.rubric_template_categories[0].id)
      feedback_6 = create(:project_feedback, instructor_id: @instructor.id, project_id: @project_2.id, rubric_template_category_id: mod2_rubric.rubric_template_categories[1].id)
      feedback_7 = create(:project_feedback, instructor_id: @instructor.id, project_id: @project_2.id, rubric_template_category_id: mod2_rubric.rubric_template_categories[2].id)
      feedback_8 = create(:project_feedback, instructor_id: @instructor.id, project_id: @project_2.id, rubric_template_category_id: mod2_rubric.rubric_template_categories[3].id)
      feedback_9 = create(:project_feedback, instructor_id: @instructor.id, project_id: @project_2.id, rubric_template_category_id: mod2_rubric.rubric_template_categories[4].id)
      feedback_10 = create(:project_feedback, instructor_id: @instructor.id, project_id: @project_3.id, rubric_template_category_id: mod2_rubric.rubric_template_categories[0].id)
      feedback_11 = create(:project_feedback, instructor_id: @instructor.id, project_id: @project_3.id, rubric_template_category_id: mod2_rubric.rubric_template_categories[1].id)
      feedback_12 = create(:project_feedback, instructor_id: @instructor.id, project_id: @project_3.id, rubric_template_category_id: mod2_rubric.rubric_template_categories[2].id)
      feedback_13 = create(:project_feedback, instructor_id: @instructor.id, project_id: @project_3.id, rubric_template_category_id: mod2_rubric.rubric_template_categories[3].id)
      feedback_14 = create(:project_feedback, instructor_id: @instructor.id, project_id: @project_3.id, rubric_template_category_id: mod2_rubric.rubric_template_categories[4].id)
    end

    it "returns a single student's projects and feedback for matching mod when given valid data" do
      mod = 2

      get "/api/v1/students/#{@student.id}/student_projects?mod=#{mod}"

      json = JSON.parse(response.body, symbolize_names:true)

      expect(response).to be_successful
      expect(json).to be_a(Hash)
      expect(json[:data]).to be_a(Hash)
      expect(json[:data]).to have_key(:id)
      expect(json[:data][:id]).to be_a(String)
      expect(json[:data][:id]).to eq(@student.id.to_s)
      expect(json[:data]).to have_key(:type)
      expect(json[:data][:type]).to eq("projects")
      expect(json[:data][:attributes]).to be_a(Hash)
      expect(json[:data][:attributes]).to have_key(:mod)
      expect(json[:data][:attributes][:mod]).to be_a(String)
      expect(json[:data][:attributes][:mod]).to eq(mod.to_s)
      expect(json[:data][:attributes]).to have_key(:student_projects)
      expect(json[:data][:attributes][:student_projects]).to be_an(Array)
      expect(json[:data][:attributes][:student_projects].count).to eq(2)
      expect(json[:data][:attributes]).to have_key(:student_projects)
      expect(json[:data][:attributes][:student_projects].first).to have_key(:project_feedback)
      expect(json[:data][:attributes][:student_projects].first[:project_feedback]).to be_an(Array)
      expect(json[:data][:attributes][:student_projects].first[:project_feedback].count).to eq(5)
    end

    it "the projects response for valid request includes student project data" do
      mod = 2

      get "/api/v1/students/#{@student.id}/student_projects?mod=#{mod}"

      json = JSON.parse(response.body, symbolize_names:true)
      project = json[:data][:attributes][:student_projects].first

      expect(project[:id]).to be_a(Integer)
      expect(project[:name]).to be_a(String)
      expect(project[:program]).to be_a(String)
      expect(project[:project_number]).to be_a(String)
      expect(project[:project_type]).to be_a(String)
      expect(project[:is_final_project]).to be_a(FalseClass).or be_a(TrueClass)
      expect(project[:instructor_comments]).to be_a(String)
      expect(project[:student_comments]).to be_a(String)
    end

    it "the projects response for a valid request includes project feedback data" do
      mod = 2

      get "/api/v1/students/#{@student.id}/student_projects?mod=#{mod}"

      json = JSON.parse(response.body, symbolize_names:true)
      feedback = json[:data][:attributes][:student_projects].first[:project_feedback].first

      expect(feedback[:id]).to be_a(Integer)
      expect(feedback[:rubric_category_name]).to be_a(String)
      expect(feedback[:score]).to be_a(Float)
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

  describe 'sad path' do
    it "when no projects are found for current mod it returns an nil for student_projects" do
      student = create(:user, role: 0)
      student_profile = create(:user_profile, user_id: student.id, current_mod: "2", starting_cohort: "2011", current_cohort: "2011", status: 0)
      mod = 2

      get "/api/v1/students/#{student.id}/student_projects?mod=#{mod}"

      json = JSON.parse(response.body, symbolize_names:true)

      expect(response).to be_successful
      expect(json[:data][:attributes][:student_projects]).to be_nil
      expect(json[:data][:attributes][:project_feedback]).to be_nil
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
      expect(json[:error]).to eq("Mod parameter is missing or invalid")
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
