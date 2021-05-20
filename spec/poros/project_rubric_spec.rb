require 'rails_helper'

RSpec.describe ProjectRubric do
  it "exists" do
    @student = create(:user, role: 0)
    @student_2 = create(:user, role: 0)
    @instructor = create(:user, role: 1)
    instructor_student = create(:instructor_student, instructor_id: @instructor.id, student_id: @student.id)
    student_profile = create(:user_profile, user_id: @student.id, current_mod: "2", starting_cohort: "2011", current_cohort: "2011", status: 0)
    instructor_profile = create(:user_profile, user_id: @instructor.id, current_mod: "2")
    @mod2_rubric = create(:rubric_template)
    testing = create(:rubric_category)
    oop = create(:rubric_category)
    code_quality = create(:rubric_category)
    completion = create(:rubric_category)
    active_record = create(:rubric_category)
    @mod2_rubric.rubric_categories << [testing, oop, code_quality, completion, active_record]
    @project_template_2 = create(:project_template, mod: "2", project_number: "2", rubric_template_id: @mod2_rubric.id)
    @project_2 = create(:student_project, student_id: @student.id, project_template_id: @project_template_2.id)

    data = {instructor_student_id: @student.id, mod: "2", project_number: "2", }
    project_rubric = ProjectRubric.new(data)

    expect(project_rubric).to be_a ProjectRubric
    expect(project_rubric.mod).to be_a String
    expect(project_rubric.project_number).to be_a String
    expect(project_rubric.rubric_template).to be_an Array
    expect(project_rubric.rubric_template.length).to eq(@mod2_rubric.rubric_categories.length)
    expect(project_rubric.project_number).to eq(@project_template_2.project_number)
    expect(project_rubric.mod).to eq(@project_template_2.mod)
    expect(project_rubric.student_id).to eq(@student.id)
    expect(project_rubric.student_id).to_not eq(@student_2.id)
  end
end