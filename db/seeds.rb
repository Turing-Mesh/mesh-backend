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

# be mod1

student_0 = FactoryBot.create(:user, role: 0)
student_0_profile = FactoryBot.create(:user_profile, user_id: student_0.id, current_mod: "1", starting_cohort: "2102", current_cohort: "2102", status: 0, program: "BE")
student_1 = FactoryBot.create(:user, role: 0)
student_1_profile = FactoryBot.create(:user_profile, user_id: student_1.id, current_mod: "1", starting_cohort: "2102", current_cohort: "2102", status: 0, program: "BE")
student_2 = FactoryBot.create(:user, role: 0)
student_2_profile = FactoryBot.create(:user_profile, user_id: student_2.id, current_mod: "1", starting_cohort: "2102", current_cohort: "2102", status: 0, program: "BE")
instructor_1 = FactoryBot.create(:user, role: 1)
instructor_1_profile = FactoryBot.create(:user_profile, user_id: instructor_1.id, current_mod: "1", program: "BE")

mod1_be_1 = FactoryBot.create(:instructor_student, instructor_id: instructor_1.id, student_id: student_0.id)
mod1_be_2 = FactoryBot.create(:instructor_student, instructor_id: instructor_1.id, student_id: student_1.id)
mod1_be_3 = FactoryBot.create(:instructor_student, instructor_id: instructor_1.id, student_id: student_2.id)

# fe mod1
student_3 = FactoryBot.create(:user, role: 0)
student_3_profile = FactoryBot.create(:user_profile, user_id: student_3.id, current_mod: "1", starting_cohort: "2102", current_cohort: "2102", status: 0, program: "FE")
student_4 = FactoryBot.create(:user, role: 0)
student_4_profile = FactoryBot.create(:user_profile, user_id: student_4.id, current_mod: "1", starting_cohort: "2102", current_cohort: "2102", status: 0, program: "FE")
student_5 = FactoryBot.create(:user, role: 0)
student_5_profile = FactoryBot.create(:user_profile, user_id: student_5.id, current_mod: "1", starting_cohort: "2102", current_cohort: "2102", status: 0, program: "FE")
instructor_2 = FactoryBot.create(:user, role: 1)
instructor_2_profile = FactoryBot.create(:user_profile, user_id: instructor_2.id, current_mod: "1", program: "BE")

mod1_fe_1 = FactoryBot.create(:instructor_student, instructor_id: instructor_2.id, student_id: student_3.id)
mod1_fe_2 = FactoryBot.create(:instructor_student, instructor_id: instructor_2.id, student_id: student_4.id)
mod1_fe_3 = FactoryBot.create(:instructor_student, instructor_id: instructor_2.id, student_id: student_5.id)


# be mod2
student_6 = FactoryBot.create(:user, role: 0)
student_6_profile = FactoryBot.create(:user_profile, user_id: student_6.id, current_mod: "2", starting_cohort: "2011", current_cohort: "2011", status: 0, program: "BE")
student_7 = FactoryBot.create(:user, role: 0)
student_7_profile = FactoryBot.create(:user_profile, user_id: student_7.id, current_mod: "2", starting_cohort: "2011", current_cohort: "2011", status: 0, program: "BE")
student_8 = FactoryBot.create(:user, role: 0)
student_8_profile = FactoryBot.create(:user_profile, user_id: student_8.id, current_mod: "2", starting_cohort: "2011", current_cohort: "2011", status: 0, program: "BE")
instructor_3 = FactoryBot.create(:user, role: 1)
instructor_3_profile = FactoryBot.create(:user_profile, user_id: instructor_3.id, current_mod: "2", program: "BE")

mod2_be_1 = FactoryBot.create(:instructor_student, instructor_id: instructor_3.id, student_id: student_6.id)
mod2_be_2 = FactoryBot.create(:instructor_student, instructor_id: instructor_3.id, student_id: student_7.id)
mod2_be_3 = FactoryBot.create(:instructor_student, instructor_id: instructor_3.id, student_id: student_8.id)

# fe mod2
student_9 = FactoryBot.create(:user, role: 0)
student_9_profile = FactoryBot.create(:user_profile, user_id: student_9.id, current_mod: "2", starting_cohort: "2011", current_cohort: "2011", status: 0, program: "FE")
student_10 = FactoryBot.create(:user, role: 0)
student_10_profile = FactoryBot.create(:user_profile, user_id: student_10.id, current_mod: "2", starting_cohort: "2011", current_cohort: "2011", status: 0, program: "FE")
student_11 = FactoryBot.create(:user, role: 0)
student_11_profile = FactoryBot.create(:user_profile, user_id: student_11.id, current_mod: "2", starting_cohort: "2011", current_cohort: "2011", status: 0, program: "FE")
instructor_4 = FactoryBot.create(:user, role: 1)
instructor_4_profile = FactoryBot.create(:user_profile, user_id: instructor_4.id, current_mod: "2", program: "BE")

mod2_fe_1 = FactoryBot.create(:instructor_student, instructor_id: instructor_4.id, student_id: student_9.id)
mod2_fe_2 = FactoryBot.create(:instructor_student, instructor_id: instructor_4.id, student_id: student_10.id)
mod2_fe_3 = FactoryBot.create(:instructor_student, instructor_id: instructor_4.id, student_id: student_11.id)


# be mod3
student_12 = FactoryBot.create(:user, role: 0)
student_12_profile = FactoryBot.create(:user_profile, user_id: student_12.id, current_mod: "3", starting_cohort: "2010", current_cohort: "2010", status: 0, program: "BE")
student_13 = FactoryBot.create(:user, role: 0)
student_13_profile = FactoryBot.create(:user_profile, user_id: student_13.id, current_mod: "3", starting_cohort: "2010", current_cohort: "2010", status: 0, program: "BE")
student_14 = FactoryBot.create(:user, role: 0)
student_14_profile = FactoryBot.create(:user_profile, user_id: student_14.id, current_mod: "3", starting_cohort: "2010", current_cohort: "2010", status: 0, program: "BE")
instructor_5 = FactoryBot.create(:user, role: 1)
instructor_5_profile = FactoryBot.create(:user_profile, user_id: instructor_5.id, current_mod: "3", program: "BE")

mod3_be_1 = FactoryBot.create(:instructor_student, instructor_id: instructor_5.id, student_id: student_12.id)
mod3_be_2 = FactoryBot.create(:instructor_student, instructor_id: instructor_5.id, student_id: student_13.id)
mod3_be_3 = FactoryBot.create(:instructor_student, instructor_id: instructor_5.id, student_id: student_14.id)

# fe mod3
student_15 = FactoryBot.create(:user, role: 0)
student_15_profile = FactoryBot.create(:user_profile, user_id: student_15.id, current_mod: "3", starting_cohort: "2010", current_cohort: "2010", status: 0, program: "FE")
student_16 = FactoryBot.create(:user, role: 0)
student_16_profile = FactoryBot.create(:user_profile, user_id: student_16.id, current_mod: "3", starting_cohort: "2010", current_cohort: "2010", status: 0, program: "FE")
student_17 = FactoryBot.create(:user, role: 0)
student_17_profile = FactoryBot.create(:user_profile, user_id: student_17.id, current_mod: "3", starting_cohort: "2010", current_cohort: "2010", status: 0, program: "FE")
instructor_6 = FactoryBot.create(:user, role: 1)
instructor_6_profile = FactoryBot.create(:user_profile, user_id: instructor_6.id, current_mod: "3", program: "BE")

mod3_fe_1 = FactoryBot.create(:instructor_student, instructor_id: instructor_6.id, student_id: student_15.id)
mod3_fe_2 = FactoryBot.create(:instructor_student, instructor_id: instructor_6.id, student_id: student_16.id)
mod3_fe_3 = FactoryBot.create(:instructor_student, instructor_id: instructor_6.id, student_id: student_17.id)




#mod4
student_18 = FactoryBot.create(:user, role: 0)
student_18_profile = FactoryBot.create(:user_profile, user_id: student_18.id, current_mod: "4", starting_cohort: "2008", current_cohort: "2008", status: 0, program: "BE")
student_19 = FactoryBot.create(:user, role: 0)
student_19_profile = FactoryBot.create(:user_profile, user_id: student_19.id, current_mod: "4", starting_cohort: "2008", current_cohort: "2008", status: 0, program: "BE")
student_20 = FactoryBot.create(:user, role: 0)
student_20_profile = FactoryBot.create(:user_profile, user_id: student_20.id, current_mod: "4", starting_cohort: "2008", current_cohort: "2008", status: 0, program: "BE")
instructor_7 = FactoryBot.create(:user, role: 1)
instructor_7_profile = FactoryBot.create(:user_profile, user_id: instructor_5.id, current_mod: "4", program: "BE")

mod4_be_1 = FactoryBot.create(:instructor_student, instructor_id: instructor_7.id, student_id: student_18.id)
mod4_be_2 = FactoryBot.create(:instructor_student, instructor_id: instructor_7.id, student_id: student_19.id)
mod4_be_3 = FactoryBot.create(:instructor_student, instructor_id: instructor_7.id, student_id: student_20.id)

student_21 = FactoryBot.create(:user, role: 0)
student_21_profile = FactoryBot.create(:user_profile, user_id: student_21.id, current_mod: "4", starting_cohort: "2008", current_cohort: "2008", status: 0, program: "FE")
student_22 = FactoryBot.create(:user, role: 0)
student_22_profile = FactoryBot.create(:user_profile, user_id: student_22.id, current_mod: "4", starting_cohort: "2008", current_cohort: "2008", status: 0, program: "FE")
student_23 = FactoryBot.create(:user, role: 0)
student_23_profile = FactoryBot.create(:user_profile, user_id: student_23.id, current_mod: "4", starting_cohort: "2008", current_cohort: "2008", status: 0, program: "FE")
instructor_8 = FactoryBot.create(:user, role: 1)
instructor_8_profile = FactoryBot.create(:user_profile, user_id: instructor_8.id, current_mod: "4", program: "BE")

mod4_fe_1 = FactoryBot.create(:instructor_student, instructor_id: instructor_8.id, student_id: student_15.id)
mod4_fe_2 = FactoryBot.create(:instructor_student, instructor_id: instructor_8.id, student_id: student_16.id)
mod4_fe_3 = FactoryBot.create(:instructor_student, instructor_id: instructor_8.id, student_id: student_17.id)


# rubric categories
#
testing = FactoryBot.create(:rubric_category, name: "Testing")
tdd = FactoryBot.create(:rubric_category, name: "Test Driven Development")
testing_and_debugging = FactoryBot.create(:rubric_category, name: "Testing & Debugging")
ruby_mechanics = FactoryBot.create(:rubric_category ,name: "Ruby Mechanics")
ruby_conventions = FactoryBot.create(:rubric_category, name: "Ruby Conventions")
convention_mechanics = FactoryBot.create(:rubric_category, name: "Ruby Conventions & Mechanics")
design = FactoryBot.create(:rubric_category, name: "Design")
database_design = FactoryBot.create(:rubric_category, name: "Database Design")
oop = FactoryBot.create(:rubric_category, name: "Object Oriented Programming")
mechanics = FactoryBot.create(:rubric_category, name: "Mechanics")
functionality = FactoryBot.create(:rubric_category, name: "Functionality")
feature_completeness = FactoryBot.create(:rubric_category, name: "Feature Completeness")
rails = FactoryBot.create(:rubric_category, name: "Rails")
ar = FactoryBot.create(:rubric_category, name: "Active Record")
version_control = FactoryBot.create(:rubric_category, name: "Version Control")
project_management = FactoryBot.create(:rubric_category, name: "Project Management")
api_consumption = FactoryBot.create(:rubric_category, name: "API Consumption")
code_quality = FactoryBot.create(:rubric_category, name: "Code Quality")
technical_quality = FactoryBot.create(:rubric_category, name: "Technical Quality")
technical_presentation = FactoryBot.create(:rubric_category, name: "Technical Presentation")
feature_delivery = FactoryBot.create(:rubric_category, name: "Feature Delivery")

js = FactoryBot.create(:rubric_category, name: "JavaScript")
react = FactoryBot.create(:rubric_categories, name: "React")
professionalism = FactoryBot.create(:rubric_category, name: "Professionalism")

agile = FactoryBot.create(:rubric_category, name: "Agile Process")
git_workflow = FactoryBot.create(:rubric_category, name: "Git Workflow")
ci = FactoryBot.create(:rubric_category, name: "CI & Deployment")
documentation = FactoryBot.create(:rubric_category, name: "Documentation")
stretch_goal = FactoryBot.create(:rubric_category, name: "Stretch Goal")
fe_ui = FactoryBot.create(:rubric_category, name: "Front-End UI/UX")
fe_quality = FactoryBot.create(:rubric_category, name: "Front-End Code Quality & Testing")


# 2 rubric_templates, 1 for mod 1, and 1 for mod 2 projects
# mod1
be_mod1_project_1_rubric = FactoryBot.create(:rubric_template)
be_mod1_project_1_rubric.rubric_categories << [testing, functionality, ruby_mechanics, ruby_conventions, version_control]
fe_mod1_project_1_rubric = FactoryBot.create(:rubric_template)
fe_mod1_project_1_rubric.rubric_categories << [js, professionalism, functionality, testing]
be_mod1_project_2_rubric_a = FactoryBot.create(:rubric_template)
be_mod1_project_2_rubric_a.rubric_categories << [tdd, functionality, ruby_mechanics, ruby_conventions, version_control]
be_mod1_project_2_rubric_b = FactoryBot.create(:rubric_template)
be_mod1_project_2_rubric_b.rubric_categories << [tdd, functionality, oop, version_control]
fe_mod1_project_2_rubric = FactoryBot.create(:rubric_template)
fe_mod1_project_2_rubric.rubric_categories << [tdd, functionality, js, professionalism]
be_mod1_project_3_rubric = FactoryBot.create(:rubric_template)
be_mod1_project_3_rubric.rubric_categories << [tdd, functionality, convention_mechanics]
fe_mod1_project_3_rubric = FactoryBot.create(:rubric_template)
fe_mod1_project_3_rubric.rubric_categories << [tdd, functionality, js, professionalism]
be_mod1_project_4_rubric = FactoryBot.create(:rubric_template)
be_mod1_project_4_rubric.rubric_categories << [tdd, functionality, oop, convention_mechanics]
fe_mod1_project_4_rubric = FactoryBot.create(:rubric_template)
fe_mod1_project_4_rubric.rubric_categories << [tdd, functionality, js, professionalism, design]

# mod2
be_mod2_project_1_rubric = FactoryBot.create(:rubric_template)
be_mod2_project_1_rubric.rubric_categories << [testing_and_debugging, feature_completeness, rails, database_design, ar]
fe_mod2_project_1_rubric = FactoryBot.create(:rubric_template)
fe_mod2_project_1_rubric.rubric_categories << [js, professionalism, functionality, testing, fe_ui]
be_mod2_project_2_rubric = FactoryBot.create(:rubric_template)
be_mod2_project_2_rubric.rubric_categories << [testing_and_debugging, feature_completeness, rails, database_design, ar]
fe_mod2_project_2_rubric = FactoryBot.create(:rubric_template)
fe_mod2_project_2_rubric.rubric_categories << [js, professionalism, functionality, testing, fe_ui]
be_mod2_project_3_rubric = FactoryBot.create(:rubric_template)
be_mod2_project_3_rubric.rubric_categories << [testing_and_debugging, feature_completeness, rails, ar, api_consumption]
fe_mod2_project_3_rubric = FactoryBot.create(:rubric_template)
fe_mod2_project_3_rubric.rubric_categories << [js, professionalism, functionality, testing, fe_ui]
be_mod2_project_4_rubric = FactoryBot.create(:rubric_template)
be_mod2_project_4_rubric.rubric_categories << [testing_and_debugging, feature_completeness, rails, database_design, ar]
fe_mod2_project_4_rubric = FactoryBot.create(:rubric_template)
fe_mod2_project_4_rubric.rubric_categories << [js, professionalism, functionality, testing, fe_ui]

# mod3
be_mod3_project_1_rubric = FactoryBot.create(:rubric_template)
be_mod3_project_1_rubric.rubric_categories << [testing_and_debugging, feature_completeness, rails, database_design, ar]
fe_mod3_project_1_rubric = FactoryBot.create(:rubric_template)
fe_mod3_project_1_rubric.rubric_categories << [js, professionalism, functionality, testing, fe_ui, react]
be_mod3_project_2_rubric = FactoryBot.create(:rubric_template)
be_mod3_project_2_rubric.rubric_categories << [testing_and_debugging, feature_completeness, rails, database_design, ar]
fe_mod3_project_2_rubric = FactoryBot.create(:rubric_template)
fe_mod3_project_2_rubric.rubric_categories << [js, professionalism, functionality, testing, fe_ui, react]
be_mod3_project_3_rubric = FactoryBot.create(:rubric_template)
be_mod3_project_3_rubric.rubric_categories << [testing_and_debugging, feature_completeness, rails, ar, api_consumption]
fe_mod3_project_3_rubric = FactoryBot.create(:rubric_template)
fe_mod3_project_3_rubric.rubric_categories << [js, professionalism, functionality, testing, fe_ui, react]
be_mod3_project_4_rubric = FactoryBot.create(:rubric_template)
be_mod3_project_4_rubric.rubric_categories << [testing_and_debugging, feature_completeness, rails, database_design, ar]
fe_mod3_project_4_rubric = FactoryBot.create(:rubric_template)
fe_mod3_project_4_rubric.rubric_categories << [js, professionalism, functionality, testing, fe_ui, react]

# mod4
be_mod4_project_1_rubric = FactoryBot.create(:rubric_template)
be_mod4_project_1_rubric.rubric_categories << [agile, git_workflow, ci, documentation, testing_and_debugging, stretch_goal, fe_ui, fe_quality]
fe_mod4_project_1_rubric = FactoryBot.create(:rubric_template)
fe_mod4_project_1_rubric.rubric_categories << [agile, git_workflow, ci, documentation, testing_and_debugging, stretch_goal, fe_ui, fe_quality]

# projects
flashcards = FactoryBot.create(:project_template, mod: "1", project_number: "1", rubric_template_id: be_mod1_project_1_rubric.id, name: "Flashcards", program: "BE", project_type: 0)
battleship = FactoryBot.create(:project_template, mod: "1", project_number: "2", rubric_template_id: be_mod1_project_2_rubric_a.id, name: "Battleship", program: "BE", project_type: 1)
mastermind = FactoryBot.create(:project_template, mod: "1", project_number: "2", rubric_template_id: be_mod1_project_2_rubric_b.id, name: "Mastermind", program: "BE", project_type: 1)
black_thursday = FactoryBot.create(:project_template, mod: "1", project_number: "3", rubric_template_id: be_mod1_project_3_rubric.id, name: "Black Thursday", program: "BE", project_type: 2)
futbol = FactoryBot.create(:project_template, mod: "1", project_number: "3", rubric_template_id: be_mod1_project_3_rubric.id, name: "Futbol", program: "BE", project_type: 2)
enigma = FactoryBot.create(:project_template, mod: "1", project_number: "4", rubric_template_id: be_mod1_project_4_rubric.id, name: "Enigma", program: "BE", is_final: true, project_type: 0)
nightwriter = FactoryBot.create(:project_template, mod: "1", project_number: "4", rubric_template_id: be_mod1_project_4_rubric.id, name: "Night Writer", program: "BE", is_final: true, project_type: 0)

js_fun_library = FactoryBot.create(:project_template, mod: "1", project_number: "1", rubric_template_id: fe_mod1_project_1_rubric.id, name: "JS Fun at the Library", program: "FE", project_type: 0)
rom_com = FactoryBot.create(:project_template, mod: "1", project_number: "2", rubric_template_id: fe_mod1_project_2_rubric.id, name: "RomCom", program: "FE", project_type: 1)
intention = FactoryBot.create(:project_template, mod: "1", project_number: "3", rubric_template_id: fe_mod1_project_3_rubric.id, name: "Intention Timer", program: "FE", project_type: 2)
tic_tac_toe = FactoryBot.create(:project_template, mod: "1", project_number: "4", rubric_template_id: fe_mod1_project_4_rubric.id, name: "Tic Tac Toe", program: "FE", is_final: true, project_type: 0)

relational = FactoryBot.create(:project_template, mod: "2", project_number: "1", rubric_template_id: be_mod2_project_1_rubric.id, name: "Relational Rails", program: "BE", project_type: 1)
adopt = FactoryBot.create(:project_template, mod: "2", project_number: "2", rubric_template_id: be_mod2_project_2_rubric.id, name: "Adopt don't Shop", program: "BE", project_type: 0)
black_rails = FactoryBot.create(:project_template, mod: "2", project_number: "3", rubric_template_id: be_mod2_project_3_rubric.id, name: "Black Thursday on Rails", program: "BE", project_type: 2)
discounts = FactoryBot.create(:project_template, mod: "2", project_number: "4", rubric_template_id: be_mod2_project_4_rubric.id, name: "Bulk Discounts", program: "BE", is_final: true, project_type: 0)

js_fun = FactoryBot.create(:project_template, mod: "2", project_number: "1", rubric_template_id: fe_mod2_project_1_rubric.id, name: "JSFun", program: "FE", project_type: 0)
fit = FactoryBot.create(:project_template, mod: "2", project_number: "2", rubric_template_id: fe_mod2_project_2_rubric.id, name: "FitLit", program: "FE", project_type: 1)
game_time = FactoryBot.create(:project_template, mod: "2", project_number: "3", rubric_template_id: fe_mod2_project_3_rubric.id, name: "Game Time", program: "FE", project_type: 2)
travel_tracker = FactoryBot.create(:project_template, mod: "2", project_number: "4", rubric_template_id: fe_mod2_project_4_rubric.id, name: "Travel Tracker", program: "FE", is_final: true, project_type: 0)

viewing_party = FactoryBot.create(:project_template, mod: "3", project_number: "1", rubric_template_id: be_mod3_project_1_rubric.id, name: "Relational Rails", program: "BE", project_type: 0)
black_api_edition = FactoryBot.create(:project_template, mod: "3", project_number: "2", rubric_template_id: be_mod3_project_2_rubric.id, name: "Black Thursday API Edition", program: "BE", project_type: 1)
consultancy = FactoryBot.create(:project_template, mod: "3", project_number: "3", rubric_template_id: be_mod3_project_3_rubric.id, name: "Consultancy", program: "BE", project_type: 2)
weather = FactoryBot.create(:project_template, mod: "3", project_number: "4", rubric_template_id: be_mod3_project_4_rubric.id, name: "Sweater Weather", program: "BE", is_final: true, project_type: 0)

tomatillos = FactoryBot.create(:project_template, mod: "3", project_number: "1", rubric_template_id: fe_mod3_project_1_rubric.id, name: "Rancid Tomatillos", program: "FE", project_type: 0)
stretch = FactoryBot.create(:project_template, mod: "3", project_number: "2", rubric_template_id: fe_mod3_project_2_rubric.id, name: "Stretch", program: "FE", project_type: 1)
niche_audience = FactoryBot.create(:project_template, mod: "3", project_number: "3", rubric_template_id: fe_mod3_project_3_rubric.id, name: "Niche Audience", program: "FE", project_type: 2)
ideas = FactoryBot.create(:project_template, mod: "3", project_number: "4", rubric_template_id: fe_mod3_project_4_rubric.id, name: "Ideas-4-Ideaboxes", program: "FE", is_final: true, project_type: 0)

capstone_be = FactoryBot.create(:project_template, mod: "4", project_number: "1", rubric_template_id: be_mod4_project_1_rubric.id, name: "Capstone", program: "BE", project_type: 2)
capstone_fe = FactoryBot.create(:project_template, mod: "4", project_number: "1", rubric_template_id: fe_mod4_project_1_rubric.id, name: "Capstone", program: "FE", project_type: 2)


# Student 0 Projects
student_0_mod1_project_1 = FactoryBot.create(:student_project, student_id: student_0.id, project_template_id: flashcards.id)
student_0_mod1_project_2 = FactoryBot.create(:student_project, student_id: student_0.id, project_template_id: battleship.id)
student_0_mod1_project_3 = FactoryBot.create(:student_project, student_id: student_0.id, project_template_id: black_thursday.id)
student_0_mod1_project_4 = FactoryBot.create(:student_project, student_id: student_0.id, project_template_id: enigma.id)
# Student 1 Projects
student_1_mod1_project_1 = FactoryBot.create(:student_project, student_id: student_1.id, project_template_id: flashcards.id)
student_1_mod1_project_2 = FactoryBot.create(:student_project, student_id: student_1.id, project_template_id: battleship.id)
student_1_mod1_project_3 = FactoryBot.create(:student_project, student_id: student_1.id, project_template_id: black_thursday.id)
student_1_mod1_project_4 = FactoryBot.create(:student_project, student_id: student_1.id, project_template_id: enigma.id)
# Student 2 Projects
student_2_mod1_project_1 = FactoryBot.create(:student_project, student_id: student_2.id, project_template_id: flashcards.id)
student_2_mod1_project_2 = FactoryBot.create(:student_project, student_id: student_2.id, project_template_id: battleship.id)
student_2_mod1_project_3 = FactoryBot.create(:student_project, student_id: student_2.id, project_template_id: black_thursday.id)
student_2_mod1_project_4 = FactoryBot.create(:student_project, student_id: student_2.id, project_template_id: enigma.id)
# Student 3 Projects
student_3_mod1_project_1 = FactoryBot.create(:student_project, student_id: student_3.id, project_template_id: js_fun_library.id)
student_3_mod1_project_2 = FactoryBot.create(:student_project, student_id: student_3.id, project_template_id: rom_com.id)
student_3_mod1_project_3 = FactoryBot.create(:student_project, student_id: student_3.id, project_template_id: intention.id)
student_3_mod1_project_4 = FactoryBot.create(:student_project, student_id: student_3.id, project_template_id: tic_tac_toe.id)
# Student 4 Projects
student_4_mod1_project_1 = FactoryBot.create(:student_project, student_id: student_4.id, project_template_id: js_fun_library.id)
student_4_mod1_project_2 = FactoryBot.create(:student_project, student_id: student_4.id, project_template_id: rom_com.id)
student_4_mod1_project_3 = FactoryBot.create(:student_project, student_id: student_4.id, project_template_id: intention.id)
student_4_mod1_project_4 = FactoryBot.create(:student_project, student_id: student_4.id, project_template_id: tic_tac_toe.id)
# Student 5 Projects
student_5_mod1_project_1 = FactoryBot.create(:student_project, student_id: student_5.id, project_template_id: js_fun_library.id)
student_5_mod1_project_2 = FactoryBot.create(:student_project, student_id: student_5.id, project_template_id: rom_com.id)
student_5_mod1_project_3 = FactoryBot.create(:student_project, student_id: student_5.id, project_template_id: intention.id)
student_5_mod1_project_4 = FactoryBot.create(:student_project, student_id: student_5.id, project_template_id: tic_tac_toe.id)
# Student 6 Projects
student_6_mod1_project_1 = FactoryBot.create(:student_project, student_id: student_6.id, project_template_id: flashcards.id)
student_6_mod1_project_2 = FactoryBot.create(:student_project, student_id: student_6.id, project_template_id: battleship.id)
student_6_mod1_project_3 = FactoryBot.create(:student_project, student_id: student_6.id, project_template_id: futbol.id)
student_6_mod1_project_4 = FactoryBot.create(:student_project, student_id: student_6.id, project_template_id: nightwriter.id)
student_6_mod2_project_1 = FactoryBot.create(:student_project, student_id: student_6.id, project_template_id: relational.id)
student_6_mod2_project_2 = FactoryBot.create(:student_project, student_id: student_6.id, project_template_id: adopt.id)
student_6_mod2_project_3 = FactoryBot.create(:student_project, student_id: student_6.id, project_template_id: black_rails.id)
student_6_mod2_project_4 = FactoryBot.create(:student_project, student_id: student_6.id, project_template_id: discounts.id)
# Student 7 Projects
student_7_mod1_project_1 = FactoryBot.create(:student_project, student_id: student_7.id, project_template_id: flashcards.id)
student_7_mod1_project_2 = FactoryBot.create(:student_project, student_id: student_7.id, project_template_id: battleship.id)
student_7_mod1_project_3 = FactoryBot.create(:student_project, student_id: student_7.id, project_template_id: futbol.id)
student_7_mod1_project_4 = FactoryBot.create(:student_project, student_id: student_7.id, project_template_id: nightwriter.id)
student_7_mod2_project_1 = FactoryBot.create(:student_project, student_id: student_7.id, project_template_id: relational.id)
student_7_mod2_project_2 = FactoryBot.create(:student_project, student_id: student_7.id, project_template_id: adopt.id)
student_7_mod2_project_3 = FactoryBot.create(:student_project, student_id: student_7.id, project_template_id: black_rails.id)
student_7_mod2_project_4 = FactoryBot.create(:student_project, student_id: student_7.id, project_template_id: discounts.id)
# Student 8 Projects
student_8_mod1_project_1 = FactoryBot.create(:student_project, student_id: student_8.id, project_template_id: flashcards.id)
student_8_mod1_project_2 = FactoryBot.create(:student_project, student_id: student_8.id, project_template_id: battleship.id)
student_8_mod1_project_3 = FactoryBot.create(:student_project, student_id: student_8.id, project_template_id: futbol.id)
student_8_mod1_project_4 = FactoryBot.create(:student_project, student_id: student_8.id, project_template_id: nightwriter.id)
student_8_mod2_project_1 = FactoryBot.create(:student_project, student_id: student_8.id, project_template_id: relational.id)
student_8_mod2_project_2 = FactoryBot.create(:student_project, student_id: student_8.id, project_template_id: adopt.id)
student_8_mod2_project_3 = FactoryBot.create(:student_project, student_id: student_8.id, project_template_id: black_rails.id)
student_8_mod2_project_4 = FactoryBot.create(:student_project, student_id: student_8.id, project_template_id: discounts.id)
# Student 9 Projects
student_9_mod1_project_1 = FactoryBot.create(:student_project, student_id: student_9.id, project_template_id: js_fun_library.id)
student_9_mod1_project_2 = FactoryBot.create(:student_project, student_id: student_9.id, project_template_id: rom_com.id)
student_9_mod1_project_3 = FactoryBot.create(:student_project, student_id: student_9.id, project_template_id: intention.id)
student_9_mod1_project_4 = FactoryBot.create(:student_project, student_id: student_9.id, project_template_id: tic_tac_toe.id)
student_9_mod2_project_1 = FactoryBot.create(:student_project, student_id: student_9.id, project_template_id: js_fun.id)
student_9_mod2_project_2 = FactoryBot.create(:student_project, student_id: student_9.id, project_template_id: fit.id)
student_9_mod2_project_3 = FactoryBot.create(:student_project, student_id: student_9.id, project_template_id: game_time.id)
student_9_mod2_project_4 = FactoryBot.create(:student_project, student_id: student_9.id, project_template_id: travel_tracker.id)
# Student 10 Projects
student_10_mod1_project_1 = FactoryBot.create(:student_project, student_id: student_10.id, project_template_id: js_fun_library.id)
student_10_mod1_project_2 = FactoryBot.create(:student_project, student_id: student_10.id, project_template_id: rom_com.id)
student_10_mod1_project_3 = FactoryBot.create(:student_project, student_id: student_10.id, project_template_id: intention.id)
student_10_mod1_project_4 = FactoryBot.create(:student_project, student_id: student_10.id, project_template_id: tic_tac_toe.id)
student_10_mod2_project_1 = FactoryBot.create(:student_project, student_id: student_10.id, project_template_id: js_fun.id)
student_10_mod2_project_2 = FactoryBot.create(:student_project, student_id: student_10.id, project_template_id: fit.id)
student_10_mod2_project_3 = FactoryBot.create(:student_project, student_id: student_10.id, project_template_id: game_time.id)
student_10_mod2_project_4 = FactoryBot.create(:student_project, student_id: student_10.id, project_template_id: travel_tracker.id)
# Student 11 Projects
student_11_mod1_project_1 = FactoryBot.create(:student_project, student_id: student_11.id, project_template_id: js_fun_library.id)
student_11_mod1_project_2 = FactoryBot.create(:student_project, student_id: student_11.id, project_template_id: rom_com.id)
student_11_mod1_project_3 = FactoryBot.create(:student_project, student_id: student_11.id, project_template_id: intention.id)
student_11_mod1_project_4 = FactoryBot.create(:student_project, student_id: student_11.id, project_template_id: tic_tac_toe.id)
student_11_mod2_project_1 = FactoryBot.create(:student_project, student_id: student_11.id, project_template_id: js_fun.id)
student_11_mod2_project_2 = FactoryBot.create(:student_project, student_id: student_11.id, project_template_id: fit.id)
student_11_mod2_project_3 = FactoryBot.create(:student_project, student_id: student_11.id, project_template_id: game_time.id)
student_11_mod2_project_4 = FactoryBot.create(:student_project, student_id: student_11.id, project_template_id: travel_tracker.id)
# Student 12 Projects
student_12_mod1_project_1 = FactoryBot.create(:student_project, student_id: student_12.id, project_template_id: flashcards.id)
student_12_mod1_project_2 = FactoryBot.create(:student_project, student_id: student_12.id, project_template_id: mastermind.id)
student_12_mod1_project_3 = FactoryBot.create(:student_project, student_id: student_12.id, project_template_id: black_thursday.id)
student_12_mod1_project_4 = FactoryBot.create(:student_project, student_id: student_12.id, project_template_id: enigma.id)
student_12_mod2_project_1 = FactoryBot.create(:student_project, student_id: student_12.id, project_template_id: relational.id)
student_12_mod2_project_2 = FactoryBot.create(:student_project, student_id: student_12.id, project_template_id: adopt.id)
student_12_mod2_project_3 = FactoryBot.create(:student_project, student_id: student_12.id, project_template_id: black_rails.id)
student_12_mod2_project_4 = FactoryBot.create(:student_project, student_id: student_12.id, project_template_id: discounts.id)
student_12_mod3_project_1 = FactoryBot.create(:student_project, student_id: student_12.id, project_template_id: viewing_party.id)
student_12_mod3_project_2 = FactoryBot.create(:student_project, student_id: student_12.id, project_template_id: black_api_edition.id)
student_12_mod3_project_3 = FactoryBot.create(:student_project, student_id: student_12.id, project_template_id: consultancy.id)
student_12_mod3_project_4 = FactoryBot.create(:student_project, student_id: student_12.id, project_template_id: weather.id)
# Student 13 Projects
student_13_mod1_project_1 = FactoryBot.create(:student_project, student_id: student_13.id, project_template_id: flashcards.id)
student_13_mod1_project_2 = FactoryBot.create(:student_project, student_id: student_13.id, project_template_id: mastermind.id)
student_13_mod1_project_3 = FactoryBot.create(:student_project, student_id: student_13.id, project_template_id: black_thursday.id)
student_13_mod1_project_4 = FactoryBot.create(:student_project, student_id: student_13.id, project_template_id: enigma.id)
student_13_mod2_project_1 = FactoryBot.create(:student_project, student_id: student_13.id, project_template_id: relational.id)
student_13_mod2_project_2 = FactoryBot.create(:student_project, student_id: student_13.id, project_template_id: adopt.id)
student_13_mod2_project_3 = FactoryBot.create(:student_project, student_id: student_13.id, project_template_id: black_rails.id)
student_13_mod2_project_4 = FactoryBot.create(:student_project, student_id: student_13.id, project_template_id: discounts.id)
student_13_mod3_project_1 = FactoryBot.create(:student_project, student_id: student_13.id, project_template_id: viewing_party.id)
student_13_mod3_project_2 = FactoryBot.create(:student_project, student_id: student_13.id, project_template_id: black_api_edition.id)
student_13_mod3_project_3 = FactoryBot.create(:student_project, student_id: student_13.id, project_template_id: consultancy.id)
student_13_mod3_project_4 = FactoryBot.create(:student_project, student_id: student_13.id, project_template_id: weather.id)

# Student 14 Projects
student_14_mod1_project_1 = FactoryBot.create(:student_project, student_id: student_14.id, project_template_id: flashcards.id)
student_14_mod1_project_2 = FactoryBot.create(:student_project, student_id: student_14.id, project_template_id: mastermind.id)
student_14_mod1_project_3 = FactoryBot.create(:student_project, student_id: student_14.id, project_template_id: black_thursday.id)
student_14_mod1_project_4 = FactoryBot.create(:student_project, student_id: student_14.id, project_template_id: enigma.id)
student_14_mod2_project_1 = FactoryBot.create(:student_project, student_id: student_14.id, project_template_id: relational.id)
student_14_mod2_project_2 = FactoryBot.create(:student_project, student_id: student_14.id, project_template_id: adopt.id)
student_14_mod2_project_3 = FactoryBot.create(:student_project, student_id: student_14.id, project_template_id: black_rails.id)
student_14_mod2_project_4 = FactoryBot.create(:student_project, student_id: student_14.id, project_template_id: discounts.id)
student_14_mod3_project_1 = FactoryBot.create(:student_project, student_id: student_14.id, project_template_id: viewing_party.id)
student_14_mod3_project_2 = FactoryBot.create(:student_project, student_id: student_14.id, project_template_id: black_api_edition.id)
student_14_mod3_project_3 = FactoryBot.create(:student_project, student_id: student_14.id, project_template_id: consultancy.id)
student_14_mod3_project_4 = FactoryBot.create(:student_project, student_id: student_14.id, project_template_id: weather.id)
# Student 15 Projects
student_15_mod1_project_1 = FactoryBot.create(:student_project, student_id: student_15.id, project_template_id: js_fun_library.id)
student_15_mod1_project_2 = FactoryBot.create(:student_project, student_id: student_15.id, project_template_id: rom_com.id)
student_15_mod1_project_3 = FactoryBot.create(:student_project, student_id: student_15.id, project_template_id: intention.id)
student_15_mod1_project_4 = FactoryBot.create(:student_project, student_id: student_15.id, project_template_id: tic_tac_toe.id)
student_15_mod2_project_1 = FactoryBot.create(:student_project, student_id: student_15.id, project_template_id: js_fun.id)
student_15_mod2_project_2 = FactoryBot.create(:student_project, student_id: student_15.id, project_template_id: fit.id)
student_15_mod2_project_3 = FactoryBot.create(:student_project, student_id: student_15.id, project_template_id: game_time.id)
student_15_mod2_project_4 = FactoryBot.create(:student_project, student_id: student_15.id, project_template_id: travel_tracker.id)
student_15_mod3_project_1 = FactoryBot.create(:student_project, student_id: student_15.id, project_template_id: tomatillos.id)
student_15_mod3_project_2 = FactoryBot.create(:student_project, student_id: student_15.id, project_template_id: stretch.id)
student_15_mod3_project_3 = FactoryBot.create(:student_project, student_id: student_15.id, project_template_id: niche_audience.id)
student_15_mod3_project_4 = FactoryBot.create(:student_project, student_id: student_15.id, project_template_id: ideas.id)
# Student 16 Projects
student_16_mod1_project_1 = FactoryBot.create(:student_project, student_id: student_16.id, project_template_id: js_fun_library.id)
student_16_mod1_project_2 = FactoryBot.create(:student_project, student_id: student_16.id, project_template_id: rom_com.id)
student_16_mod1_project_3 = FactoryBot.create(:student_project, student_id: student_16.id, project_template_id: intention.id)
student_16_mod1_project_4 = FactoryBot.create(:student_project, student_id: student_16.id, project_template_id: tic_tac_toe.id)
student_16_mod2_project_1 = FactoryBot.create(:student_project, student_id: student_16.id, project_template_id: js_fun.id)
student_16_mod2_project_2 = FactoryBot.create(:student_project, student_id: student_16.id, project_template_id: fit.id)
student_16_mod2_project_3 = FactoryBot.create(:student_project, student_id: student_16.id, project_template_id: game_time.id)
student_16_mod2_project_4 = FactoryBot.create(:student_project, student_id: student_16.id, project_template_id: travel_tracker.id)
student_16_mod3_project_1 = FactoryBot.create(:student_project, student_id: student_16.id, project_template_id: tomatillos.id)
student_16_mod3_project_2 = FactoryBot.create(:student_project, student_id: student_16.id, project_template_id: stretch.id)
student_16_mod3_project_3 = FactoryBot.create(:student_project, student_id: student_16.id, project_template_id: niche_audience.id)
student_16_mod3_project_4 = FactoryBot.create(:student_project, student_id: student_16.id, project_template_id: ideas.id)
# Student 17 Projects
student_17_mod1_project_1 = FactoryBot.create(:student_project, student_id: student_17.id, project_template_id: js_fun_library.id)
student_17_mod1_project_2 = FactoryBot.create(:student_project, student_id: student_17.id, project_template_id: rom_com.id)
student_17_mod1_project_3 = FactoryBot.create(:student_project, student_id: student_17.id, project_template_id: intention.id)
student_17_mod1_project_4 = FactoryBot.create(:student_project, student_id: student_17.id, project_template_id: tic_tac_toe.id)
student_17_mod2_project_1 = FactoryBot.create(:student_project, student_id: student_17.id, project_template_id: js_fun.id)
student_17_mod2_project_2 = FactoryBot.create(:student_project, student_id: student_17.id, project_template_id: fit.id)
student_17_mod2_project_3 = FactoryBot.create(:student_project, student_id: student_17.id, project_template_id: game_time.id)
student_17_mod2_project_4 = FactoryBot.create(:student_project, student_id: student_17.id, project_template_id: travel_tracker.id)
student_17_mod3_project_1 = FactoryBot.create(:student_project, student_id: student_17.id, project_template_id: tomatillos.id)
student_17_mod3_project_2 = FactoryBot.create(:student_project, student_id: student_17.id, project_template_id: stretch.id)
student_17_mod3_project_3 = FactoryBot.create(:student_project, student_id: student_17.id, project_template_id: niche_audience.id)
student_17_mod3_project_4 = FactoryBot.create(:student_project, student_id: student_17.id, project_template_id: ideas.id)
# Student 18 Projects
student_18_mod1_project_1 = FactoryBot.create(:student_project, student_id: student_18.id, project_template_id: flashcards.id)
student_18_mod1_project_2 = FactoryBot.create(:student_project, student_id: student_18.id, project_template_id: battleship.id)
student_18_mod1_project_3 = FactoryBot.create(:student_project, student_id: student_18.id, project_template_id: black_thursday.id)
student_18_mod1_project_4 = FactoryBot.create(:student_project, student_id: student_18.id, project_template_id: enigma.id)
student_18_mod2_project_1 = FactoryBot.create(:student_project, student_id: student_18.id, project_template_id: relational.id)
student_18_mod2_project_2 = FactoryBot.create(:student_project, student_id: student_18.id, project_template_id: adopt.id)
student_18_mod2_project_3 = FactoryBot.create(:student_project, student_id: student_18.id, project_template_id: black_rails.id)
student_18_mod2_project_4 = FactoryBot.create(:student_project, student_id: student_18.id, project_template_id: discounts.id)
student_18_mod3_project_1 = FactoryBot.create(:student_project, student_id: student_18.id, project_template_id: viewing_party.id)
student_18_mod3_project_2 = FactoryBot.create(:student_project, student_id: student_18.id, project_template_id: black_api_edition.id)
student_18_mod3_project_3 = FactoryBot.create(:student_project, student_id: student_18.id, project_template_id: consultancy.id)
student_18_mod3_project_4 = FactoryBot.create(:student_project, student_id: student_18.id, project_template_id: weather.id)
student_18_mod4_project_1 = FactoryBot.create(:student_project, student_id: student_18.id, project_template_id: capstone_be.id)
# Student 19 Projects
student_19_mod1_project_1 = FactoryBot.create(:student_project, student_id: student_19.id, project_template_id: flashcards.id)
student_19_mod1_project_2 = FactoryBot.create(:student_project, student_id: student_19.id, project_template_id: battleship.id)
student_19_mod1_project_3 = FactoryBot.create(:student_project, student_id: student_19.id, project_template_id: black_thursday.id)
student_19_mod1_project_4 = FactoryBot.create(:student_project, student_id: student_19.id, project_template_id: enigma.id)
student_19_mod2_project_1 = FactoryBot.create(:student_project, student_id: student_19.id, project_template_id: relational.id)
student_19_mod2_project_2 = FactoryBot.create(:student_project, student_id: student_19.id, project_template_id: adopt.id)
student_19_mod2_project_3 = FactoryBot.create(:student_project, student_id: student_19.id, project_template_id: black_rails.id)
student_19_mod2_project_4 = FactoryBot.create(:student_project, student_id: student_19.id, project_template_id: discounts.id)
student_19_mod3_project_1 = FactoryBot.create(:student_project, student_id: student_19.id, project_template_id: viewing_party.id)
student_19_mod3_project_2 = FactoryBot.create(:student_project, student_id: student_19.id, project_template_id: black_api_edition.id)
student_19_mod3_project_3 = FactoryBot.create(:student_project, student_id: student_19.id, project_template_id: consultancy.id)
student_19_mod3_project_4 = FactoryBot.create(:student_project, student_id: student_19.id, project_template_id: weather.id)
student_19_mod4_project_1 = FactoryBot.create(:student_project, student_id: student_19.id, project_template_id: capstone_be.id)
# Student 20 Projects
student_20_mod1_project_1 = FactoryBot.create(:student_project, student_id: student_20.id, project_template_id: flashcards.id)
student_20_mod1_project_2 = FactoryBot.create(:student_project, student_id: student_20.id, project_template_id: battleship.id)
student_20_mod1_project_3 = FactoryBot.create(:student_project, student_id: student_20.id, project_template_id: black_thursday.id)
student_20_mod1_project_4 = FactoryBot.create(:student_project, student_id: student_20.id, project_template_id: enigma.id)
student_20_mod2_project_1 = FactoryBot.create(:student_project, student_id: student_20.id, project_template_id: relational.id)
student_20_mod2_project_2 = FactoryBot.create(:student_project, student_id: student_20.id, project_template_id: adopt.id)
student_20_mod2_project_3 = FactoryBot.create(:student_project, student_id: student_20.id, project_template_id: black_rails.id)
student_20_mod2_project_4 = FactoryBot.create(:student_project, student_id: student_20.id, project_template_id: discounts.id)
student_20_mod3_project_1 = FactoryBot.create(:student_project, student_id: student_20.id, project_template_id: viewing_party.id)
student_20_mod3_project_2 = FactoryBot.create(:student_project, student_id: student_20.id, project_template_id: black_api_edition.id)
student_20_mod3_project_3 = FactoryBot.create(:student_project, student_id: student_20.id, project_template_id: consultancy.id)
student_20_mod3_project_4 = FactoryBot.create(:student_project, student_id: student_20.id, project_template_id: weather.id)
student_20_mod4_project_1 = FactoryBot.create(:student_project, student_id: student_20.id, project_template_id: capstone_be.id)
# Student 21 Projects
student_21_mod1_project_1 = FactoryBot.create(:student_project, student_id: student_21.id, project_template_id: js_fun_library.id)
student_21_mod1_project_2 = FactoryBot.create(:student_project, student_id: student_21.id, project_template_id: rom_com.id)
student_21_mod1_project_3 = FactoryBot.create(:student_project, student_id: student_21.id, project_template_id: intention.id)
student_21_mod1_project_4 = FactoryBot.create(:student_project, student_id: student_21.id, project_template_id: tic_tac_toe.id)
student_21_mod2_project_1 = FactoryBot.create(:student_project, student_id: student_21.id, project_template_id: js_fun.id)
student_21_mod2_project_2 = FactoryBot.create(:student_project, student_id: student_21.id, project_template_id: fit.id)
student_21_mod2_project_3 = FactoryBot.create(:student_project, student_id: student_21.id, project_template_id: game_time.id)
student_21_mod2_project_4 = FactoryBot.create(:student_project, student_id: student_21.id, project_template_id: travel_tracker.id)
student_21_mod3_project_1 = FactoryBot.create(:student_project, student_id: student_21.id, project_template_id: tomatillos.id)
student_21_mod3_project_2 = FactoryBot.create(:student_project, student_id: student_21.id, project_template_id: stretch.id)
student_21_mod3_project_3 = FactoryBot.create(:student_project, student_id: student_21.id, project_template_id: niche_audience.id)
student_21_mod3_project_4 = FactoryBot.create(:student_project, student_id: student_21.id, project_template_id: ideas.id)
student_21_mod4_project_1 = FactoryBot.create(:student_project, student_id: student_21.id, project_template_id: capstone_fe.id)
# Student 22 Projects
student_22_mod1_project_1 = FactoryBot.create(:student_project, student_id: student_22.id, project_template_id: js_fun_library.id)
student_22_mod1_project_2 = FactoryBot.create(:student_project, student_id: student_22.id, project_template_id: rom_com.id)
student_22_mod1_project_3 = FactoryBot.create(:student_project, student_id: student_22.id, project_template_id: intention.id)
student_22_mod1_project_4 = FactoryBot.create(:student_project, student_id: student_22.id, project_template_id: tic_tac_toe.id)
student_22_mod2_project_1 = FactoryBot.create(:student_project, student_id: student_22.id, project_template_id: js_fun.id)
student_22_mod2_project_2 = FactoryBot.create(:student_project, student_id: student_22.id, project_template_id: fit.id)
student_22_mod2_project_3 = FactoryBot.create(:student_project, student_id: student_22.id, project_template_id: game_time.id)
student_22_mod2_project_4 = FactoryBot.create(:student_project, student_id: student_22.id, project_template_id: travel_tracker.id)
student_22_mod3_project_1 = FactoryBot.create(:student_project, student_id: student_22.id, project_template_id: tomatillos.id)
student_21_mod3_project_2 = FactoryBot.create(:student_project, student_id: student_22.id, project_template_id: stretch.id)
student_22_mod3_project_3 = FactoryBot.create(:student_project, student_id: student_22.id, project_template_id: niche_audience.id)
student_22_mod3_project_4 = FactoryBot.create(:student_project, student_id: student_22.id, project_template_id: ideas.id)
student_22_mod4_project_1 = FactoryBot.create(:student_project, student_id: student_22.id, project_template_id: capstone_fe.id)
# Student 23 Projects
student_23_mod1_project_1 = FactoryBot.create(:student_project, student_id: student_23.id, project_template_id: js_fun_library.id)
student_23_mod1_project_2 = FactoryBot.create(:student_project, student_id: student_23.id, project_template_id: rom_com.id)
student_23_mod1_project_3 = FactoryBot.create(:student_project, student_id: student_23.id, project_template_id: intention.id)
student_23_mod1_project_4 = FactoryBot.create(:student_project, student_id: student_23.id, project_template_id: tic_tac_toe.id)
student_23_mod2_project_1 = FactoryBot.create(:student_project, student_id: student_23.id, project_template_id: js_fun.id)
student_23_mod2_project_2 = FactoryBot.create(:student_project, student_id: student_23.id, project_template_id: fit.id)
student_23_mod2_project_3 = FactoryBot.create(:student_project, student_id: student_23.id, project_template_id: game_time.id)
student_23_mod2_project_4 = FactoryBot.create(:student_project, student_id: student_23.id, project_template_id: travel_tracker.id)
student_23_mod3_project_1 = FactoryBot.create(:student_project, student_id: student_23.id, project_template_id: tomatillos.id)
student_23_mod3_project_2 = FactoryBot.create(:student_project, student_id: student_23.id, project_template_id: stretch.id)
student_23_mod3_project_3 = FactoryBot.create(:student_project, student_id: student_23.id, project_template_id: niche_audience.id)
student_23_mod3_project_4 = FactoryBot.create(:student_project, student_id: student_23.id, project_template_id: ideas.id)
student_23_mod4_project_1 = FactoryBot.create(:student_project, student_id: student_23.id, project_template_id: capstone_fe.id)


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
