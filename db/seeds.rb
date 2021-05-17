# delete all records
InstructorStudent.destroy_all
UserProfile.destroy_all
RubricTemplateCategory.destroy_all
ProjectFeedback.destroy_all
StudentProject.destroy_all
ProjectTemplate.destroy_all
RubricTemplate.destroy_all
RubricCategory.destroy_all
User.destroy_all

#reset pk sequences back to 1
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

#seed data
student = FactoryBot.create(:user, role: 0)
instructor = FactoryBot.create(:user, role: 1)
instructor_student = FactoryBot.create(:instructor_student, instructor_id: instructor.id, student_id: student.id)
student_profile = FactoryBot.create(:user_profile, user_id: student.id, current_mod: "2", starting_cohort: "2011", current_cohort: "2011", status: 0)
instructor_profile = FactoryBot.create(:user_profile, user_id: instructor.id, current_mod: "2")
# 2 rubric_templates, 1 for mod 1, and 1 for mod 2 projects
mod1_rubric = FactoryBot.create(:rubric_template)
mod2_rubric = FactoryBot.create(:rubric_template)
# 6 rubric categories
testing = FactoryBot.create(:rubric_category)
oop = FactoryBot.create(:rubric_category)
code_quality = FactoryBot.create(:rubric_category)
completion = FactoryBot.create(:rubric_category)
active_record = FactoryBot.create(:rubric_category)
js = FactoryBot.create(:rubric_category)
# 9 rubric_template_categories (4 for mod 1, 5 for mod 2)
mod1_rubric.rubric_categories << [testing, oop, code_quality, completion]
mod2_rubric.rubric_categories << [testing, oop, code_quality, completion, active_record]
# 3 project templates, 1 for each project above
project_template_1 = FactoryBot.create(:project_template, mod: "1", project_number: "4", rubric_template_id: mod1_rubric.id)
project_template_2 = FactoryBot.create(:project_template, mod: "2", project_number: "3", rubric_template_id: mod2_rubric.id)
project_template_3 = FactoryBot.create(:project_template, mod: "2", project_number: "4", is_final: true, rubric_template_id: mod2_rubric.id)
project_template_4 = FactoryBot.create(:project_template, mod: "3", project_number: "1", rubric_template_id: mod2_rubric.id)
# 3 projects, 1 for mod 1 and 2 for mod 2
project_1 = FactoryBot.create(:student_project, student_id: student.id, project_template_id: project_template_1.id)
project_2 = FactoryBot.create(:student_project, student_id: student.id, project_template_id: project_template_2.id)
project_3 = FactoryBot.create(:student_project, student_id: student.id, project_template_id: project_template_3.id)
# 14 project feedback (4 for mod 1 project, 5 for mod 2)
feedback_1 = FactoryBot.create(:project_feedback, instructor_id: instructor.id, project_id: project_1.id, rubric_template_category_id: mod1_rubric.rubric_template_categories[0].id)
feedback_2 = FactoryBot.create(:project_feedback, instructor_id: instructor.id, project_id: project_1.id, rubric_template_category_id: mod1_rubric.rubric_template_categories[1].id)
feedback_3 = FactoryBot.create(:project_feedback, instructor_id: instructor.id, project_id: project_1.id, rubric_template_category_id: mod1_rubric.rubric_template_categories[2].id)
feedback_4 = FactoryBot.create(:project_feedback, instructor_id: instructor.id, project_id: project_1.id, rubric_template_category_id: mod1_rubric.rubric_template_categories[3].id)
feedback_5 = FactoryBot.create(:project_feedback, instructor_id: instructor.id, project_id: project_2.id, rubric_template_category_id: mod2_rubric.rubric_template_categories[0].id)
feedback_6 = FactoryBot.create(:project_feedback, instructor_id: instructor.id, project_id: project_2.id, rubric_template_category_id: mod2_rubric.rubric_template_categories[1].id)
feedback_7 = FactoryBot.create(:project_feedback, instructor_id: instructor.id, project_id: project_2.id, rubric_template_category_id: mod2_rubric.rubric_template_categories[2].id)
feedback_8 = FactoryBot.create(:project_feedback, instructor_id: instructor.id, project_id: project_2.id, rubric_template_category_id: mod2_rubric.rubric_template_categories[3].id)
feedback_9 = FactoryBot.create(:project_feedback, instructor_id: instructor.id, project_id: project_2.id, rubric_template_category_id: mod2_rubric.rubric_template_categories[4].id)
feedback_10 = FactoryBot.create(:project_feedback, instructor_id: instructor.id, project_id: project_3.id, rubric_template_category_id: mod2_rubric.rubric_template_categories[0].id)
feedback_11 = FactoryBot.create(:project_feedback, instructor_id: instructor.id, project_id: project_3.id, rubric_template_category_id: mod2_rubric.rubric_template_categories[1].id)
feedback_12 = FactoryBot.create(:project_feedback, instructor_id: instructor.id, project_id: project_3.id, rubric_template_category_id: mod2_rubric.rubric_template_categories[2].id)
feedback_13 = FactoryBot.create(:project_feedback, instructor_id: instructor.id, project_id: project_3.id, rubric_template_category_id: mod2_rubric.rubric_template_categories[3].id)
feedback_14 = FactoryBot.create(:project_feedback, instructor_id: instructor.id, project_id: project_3.id, rubric_template_category_id: mod2_rubric.rubric_template_categories[4].id)

# reset pk sequences to current max value
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end
