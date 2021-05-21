require 'rails_helper'

describe StudentProjects, type: :request do
  describe 'happy path' do
    before :each do
      seed_test_db
    end

    it "creates a StudentProjects PORO based on input" do
      mod = 2
      id = @student.id
      project = StudentProject.student_projects_by_mod(id, mod.to_s).first
      student_project = StudentProjects.new(project)

      expect(student_project).to be_a(StudentProjects)
      expect(student_project.id).to eq(@project_2.id)
      expect(student_project.name).to be_a(String)
      expect(student_project.name).to eq(@project_template_2.name)
      expect(student_project.program).to be_a(String)
      expect(student_project.program).to eq(@project_template_2.program)
      expect(student_project.project_number).to be_a(String)
      expect(student_project.project_number).to eq(@project_template_2.project_number)
      expect(student_project.project_type).to be_a(String)
      expect(student_project.project_type).to eq(@project_template_2.project_type)
      expect(student_project.is_final_project).to be_a(FalseClass).or be_a(TrueClass)
      expect(student_project.is_final_project).to eq(@project_template_2.is_final)
      expect(student_project.average_score).to be_a(BigDecimal)
      expect(student_project.average_score).to eq(0.35e1)
      expect(student_project.instructor_comments).to be_a(String)
      expect(student_project.instructor_comments).to eq(@project_2.instructor_comments)
      expect(student_project.student_comments).to be_a(String)
      expect(student_project.student_comments).to eq(@project_2.student_comments)
      expect(student_project.project_feedback).to be_an(Array)
      expect(student_project.project_feedback.count).to eq(5)

      feedback = student_project.project_feedback.first

      expect(feedback).to be_a(Hash)
      expect(feedback[:id]).to be_an(Integer)
      expect(feedback[:id]).to eq(@feedback_5.id)
      expect(feedback[:rubric_category_name]).to be_a(String)
      expect(feedback[:rubric_category_name]).to eq(@feedback_5.rubric_category.name)
      expect(feedback[:score]).to be_a(Float)
      expect(feedback[:score]).to eq(@feedback_5.score)
      expect(feedback[:comment]).to be_a(String)
      expect(feedback[:comment]).to eq(@feedback_5.comment)
    end
  end
end
