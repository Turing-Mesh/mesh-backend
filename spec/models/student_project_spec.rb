require 'rails_helper'

RSpec.describe StudentProject, type: :model do
  describe 'validations' do
    it {should validate_presence_of :student_id}
    it {should validate_presence_of :project_template_id}
  end

  describe 'relationships' do
    it {should belong_to(:project_template)}
    it {should belong_to(:user).with_foreign_key(:student_id)}
    it {should have_many(:project_feedbacks).with_foreign_key(:project_id)}
  end

  describe 'class methods' do
    describe '::student_projects_by_mod' do
      it "returns the projects for a single student and mod" do
        student1 = create(:user, role: 0)
        student2 = create(:user, role: 0)
        mod_rubric = create(:rubric_template)
        testing = create(:rubric_category)
        mod_rubric.rubric_categories << testing
        project_template1 = create(:project_template, mod: "2", project_number: "3", rubric_template_id: mod_rubric.id)
        project_template2 = create(:project_template, mod: "3", project_number: "3", rubric_template_id: mod_rubric.id)
        project1 = create(:student_project, student_id: student1.id, project_template_id: project_template1.id)
        project2 = create(:student_project, student_id: student2.id, project_template_id: project_template1.id)
        project3 = create(:student_project, student_id: student1.id, project_template_id: project_template2.id)

        id = student1.id
        mod = "2"
        result = StudentProject.student_projects_by_mod(id, mod)

        expect(result.first.id).to eq(project1.id)
        expect(result.include?(project2)).to eq(false)
        expect(result.include?(project3)).to eq(false)
        expect(result.pluck(:id).count).to eq(1)
      end
    end
  end

  describe 'instance methods' do
    describe '#average_feedback_score' do
      it "returns the average score for the project feedback for a single student project" do
        student1 = create(:user, role: 0)
        instructor = create(:user, role: 1)
        mod_rubric = create(:rubric_template)
        testing = create(:rubric_category)
        oop = create(:rubric_category)
        completion = create(:rubric_category)
        mod_rubric.rubric_categories << [testing, oop, completion]
        project_template1 = create(:project_template, mod: "2", project_number: "3", rubric_template_id: mod_rubric.id)
        project_1 = create(:student_project, student_id: student1.id, project_template_id: project_template1.id)
        feedback_1 = create(:project_feedback, instructor_id: instructor.id, project_id: project_1.id, rubric_template_category_id: mod_rubric.rubric_template_categories[0].id, score: 3.5)
        feedback_2 = create(:project_feedback, instructor_id: instructor.id, project_id: project_1.id, rubric_template_category_id: mod_rubric.rubric_template_categories[1].id, score: 3.0)
        feedback_3 = create(:project_feedback, instructor_id: instructor.id, project_id: project_1.id, rubric_template_category_id: mod_rubric.rubric_template_categories[2].id, score: 3.0)

        expect(project_1.average_feedback_score).to eq(0.316666666666667e1)
      end
    end
  end
end
