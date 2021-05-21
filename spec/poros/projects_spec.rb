require 'rails_helper'

describe Projects, type: :request do
  describe 'happy path' do
    before :each do
      seed_test_db
    end

    it "creates a Projects PORO based on input" do
      mod = 2
      data = {mod: mod, student_id: @student.id}

      projects = Projects.new(data)

      expect(projects).to be_a(Projects)
      expect(projects.id).to eq(@student.id)
      expect(projects.mod).to be_a(Integer)
      expect(projects.mod).to eq(mod)
      expect(projects.student_projects).to be_an(Array)
      expect(projects.student_projects.count).to eq(2)
      expect(projects.student_projects.first).to be_a(StudentProjects)
      expect(projects.student_projects.include?(@project_3.project_template.name)).to eq(false)
      expect(projects.student_projects.first.project_feedback).to be_an(Array)
      expect(projects.student_projects.first.project_feedback.count).to eq(5)
      expect(projects.student_projects.first.project_feedback.include?(@active_record.name)).to eq(false)
      expect(projects.student_projects.first.project_feedback.include?(@js.name)).to eq(false)
    end
  end
end
