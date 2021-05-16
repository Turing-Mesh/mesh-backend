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
      project_template_1 = create(:project_template, mod: "1", rubric_template_id: mod1_rubric.id)
      project_template_2 = create(:project_template, mod: "2", rubric_template_id: mod2_rubric.id)
      project_template_3 = create(:project_template, mod: "2", project_number: "4", is_final: true, rubric_template_id: mod2_rubric.id)
      project_template_4 = create(:project_template, mod: "3", project_number: "1", rubric_template_id: mod2_rubric.id)
      # 3 projects, 1 for mod 1 and 2 for mod 2
      project_1 = create(:student_project, student_id: @student.id, project_template_id: project_template_1.id)
      project_2 = create(:student_project, student_id: @student.id, project_template_id: project_template_2.id)
      project_3 = create(:student_project, student_id: @student.id, project_template_id: project_template_3.id)
      # 14 project feedback (4 for mod 1 project, 5 for mod 2)
      feedback_1 = create(:project_feedback, instructor_id: @instructor.id, project_id: project_1.id, rubric_template_category_id: mod1_rubric.rubric_template_categories[0].id)
      feedback_2 = create(:project_feedback, instructor_id: @instructor.id, project_id: project_1.id, rubric_template_category_id: mod1_rubric.rubric_template_categories[1].id)
      feedback_3 = create(:project_feedback, instructor_id: @instructor.id, project_id: project_1.id, rubric_template_category_id: mod1_rubric.rubric_template_categories[2].id)
      feedback_4 = create(:project_feedback, instructor_id: @instructor.id, project_id: project_1.id, rubric_template_category_id: mod1_rubric.rubric_template_categories[3].id)
      feedback_5 = create(:project_feedback, instructor_id: @instructor.id, project_id: project_2.id, rubric_template_category_id: mod2_rubric.rubric_template_categories[0].id)
      feedback_6 = create(:project_feedback, instructor_id: @instructor.id, project_id: project_2.id, rubric_template_category_id: mod2_rubric.rubric_template_categories[1].id)
      feedback_7 = create(:project_feedback, instructor_id: @instructor.id, project_id: project_2.id, rubric_template_category_id: mod2_rubric.rubric_template_categories[2].id)
      feedback_8 = create(:project_feedback, instructor_id: @instructor.id, project_id: project_2.id, rubric_template_category_id: mod2_rubric.rubric_template_categories[3].id)
      feedback_9 = create(:project_feedback, instructor_id: @instructor.id, project_id: project_2.id, rubric_template_category_id: mod2_rubric.rubric_template_categories[4].id)
      feedback_10 = create(:project_feedback, instructor_id: @instructor.id, project_id: project_3.id, rubric_template_category_id: mod2_rubric.rubric_template_categories[0].id)
      feedback_11 = create(:project_feedback, instructor_id: @instructor.id, project_id: project_3.id, rubric_template_category_id: mod2_rubric.rubric_template_categories[1].id)
      feedback_12 = create(:project_feedback, instructor_id: @instructor.id, project_id: project_3.id, rubric_template_category_id: mod2_rubric.rubric_template_categories[2].id)
      feedback_13 = create(:project_feedback, instructor_id: @instructor.id, project_id: project_3.id, rubric_template_category_id: mod2_rubric.rubric_template_categories[3].id)
      feedback_14 = create(:project_feedback, instructor_id: @instructor.id, project_id: project_3.id, rubric_template_category_id: mod2_rubric.rubric_template_categories[4].id)
    end
    it "returns a single student's projects and feedback for matching mod when given valid data" do

    end
  end
end
