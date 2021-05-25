# delete all records
InstructorStudent.destroy_all
UserProfile.destroy_all
ProjectFeedback.destroy_all
RubricTemplateCategory.destroy_all
StudentProject.destroy_all
ProjectTemplate.destroy_all
RubricTemplate.destroy_all
RubricCategory.destroy_all
User.destroy_all

#reset pk sequences back to 1
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

#students
students = FactoryBot.create_list(:user, 105, role: 0)
#BE student user profiles
profiles_mod1_be = Array(94..105).each do |n|
  FactoryBot.create(:user_profile, user_id: n, current_mod: "1", starting_cohort: "2105", current_cohort: "2105", status: 0, program: "BE")
end
profiles_mod2_be = Array(68..82).each do |n|
  FactoryBot.create(:user_profile, user_id: n, current_mod: "2", starting_cohort: "2103", current_cohort: "2103", status: 0, program: "BE")
end
profiles_mod3_be = Array(41..53).each do |n|
  FactoryBot.create(:user_profile, user_id: n, current_mod: "3", starting_cohort: "2102", current_cohort: "2102", status: 0, program: "BE")
end
profiles_mod4_be = Array(14..28).each do |n|
  FactoryBot.create(:user_profile, user_id: n, current_mod: "4", starting_cohort: "2011", current_cohort: "2011", status: 0, program: "BE")
end
#FE student user profiles
profiles_mod1_fe = Array(83..93).each do |n|
  FactoryBot.create(:user_profile, user_id: n, current_mod: "1", starting_cohort: "2105", current_cohort: "2105", status: 0, program: "FE")
end
profiles_mod2_fe = Array(54..67).each do |n|
  FactoryBot.create(:user_profile, user_id: n, current_mod: "2", starting_cohort: "2103", current_cohort: "2103", status: 0, program: "FE")
end
profiles_mod3_fe = Array(29..40).each do |n|
  FactoryBot.create(:user_profile, user_id: n, current_mod: "3", starting_cohort: "2102", current_cohort: "2102", status: 0, program: "FE")
end
profiles_mod4_fe = Array(1..13).each do |n|
  FactoryBot.create(:user_profile, user_id: n, current_mod: "4", starting_cohort: "2011", current_cohort: "2011", status: 0, program: "FE")
end

#instructors
instructors = FactoryBot.create_list(:user, 20, role: 1)
#BE instructor user profiles
profiles_mod1_be_instr = Array(122..124).each do |n|
  FactoryBot.create(:user_profile, user_id: n, current_mod: "1", program: "BE")
end
profiles_mod2_be_instr = Array(116..118).each do |n|
  FactoryBot.create(:user_profile, user_id: n, current_mod: "2", program: "BE")
end
profiles_mod3_be_instr = Array(112..113).each do |n|
  FactoryBot.create(:user_profile, user_id: n, current_mod: "3", program: "BE")
end
profiles_mod4_instr = Array(106..109).each do |n|
  FactoryBot.create(:user_profile, user_id: n, current_mod: "4", program: "Combined")
end
#FE instructor user profiles
profiles_mod1_fe_instr = Array(119..121).each do |n|
  FactoryBot.create(:user_profile, user_id: n, current_mod: "1", program: "FE")
end
profiles_mod2_fe_instr = Array(114..115).each do |n|
  FactoryBot.create(:user_profile, user_id: n, current_mod: "2", program: "FE")
end
profiles_mod3_fe_instr = Array(110..111).each do |n|
  FactoryBot.create(:user_profile, user_id: n, current_mod: "3", program: "FE")
end

profiles_mod1_be_instr.each do |instructor|
  profiles_mod1_be.each do |student|
    FactoryBot.create(:instructor_student, instructor_id: instructor, student_id: student)
  end
end
profiles_mod2_be_instr.each do |instructor|
  profiles_mod2_be.each do |student|
    FactoryBot.create(:instructor_student, instructor_id: instructor, student_id: student)
  end
end
profiles_mod3_be_instr.each do |instructor|
  profiles_mod3_be.each do |student|
    FactoryBot.create(:instructor_student, instructor_id: instructor, student_id: student)
  end
end
profiles_mod4_instr.each do |instructor|
  profiles_mod4_be.each do |student|
    FactoryBot.create(:instructor_student, instructor_id: instructor, student_id: student)
  end
end
profiles_mod1_fe_instr.each do |instructor|
  profiles_mod1_fe.each do |student|
    FactoryBot.create(:instructor_student, instructor_id: instructor, student_id: student)
  end
end
profiles_mod2_fe_instr.each do |instructor|
  profiles_mod2_fe.each do |student|
    FactoryBot.create(:instructor_student, instructor_id: instructor, student_id: student)
  end
end
profiles_mod3_fe_instr.each do |instructor|
  profiles_mod3_fe.each do |student|
    FactoryBot.create(:instructor_student, instructor_id: instructor, student_id: student)
  end
end
profiles_mod4_instr.each do |instructor|
  profiles_mod4_fe.each do |student|
    FactoryBot.create(:instructor_student, instructor_id: instructor, student_id: student)
  end
end

test = FactoryBot.create(:rubric_category, name: "Testing/Test Driven Development")
c_and_m = FactoryBot.create(:rubric_category, name: "Conventions & Mechanics")
vcs = FactoryBot.create(:rubric_category, name: "Version Control")
completion = FactoryBot.create(:rubric_category, name: "Functionality/Completion")
oop = FactoryBot.create(:rubric_category, name: "Object Oriented Principles")
js = FactoryBot.create(:rubric_category, name: "JavaScript")
design = FactoryBot.create(:rubric_category, name: "CSS / Design")
ar = FactoryBot.create(:rubric_category, name: "Active Record")
schema = FactoryBot.create(:rubric_category, name: "Database Design")
p_and_p = FactoryBot.create(:rubric_category, name: "Professionalism/Presentation")
ui = FactoryBot.create(:rubric_category, name: "UI/UX")
pm = FactoryBot.create(:rubric_category, name: "Project Management")
stretch = FactoryBot.create(:rubric_category, name: "Stretch Tech/Goal")
rails = FactoryBot.create(:rubric_category, name: "Rails")
ci_deploy = FactoryBot.create(:rubric_category, name: "Continuous Integration & Deployment")
api = FactoryBot.create(:rubric_category, name: "API Consumption")
docs = FactoryBot.create(:rubric_category, name: "Documentation")
react = FactoryBot.create(:rubric_category, name: "React")
routing = FactoryBot.create(:rubric_category, name: "Routing")
code = FactoryBot.create(:rubric_category, name: "Code Quality")
agile = FactoryBot.create(:rubric_category, name: "Agile Process")

#BE rubric templates
rubric_1 = FactoryBot.create(:rubric_template)
rubric_1.rubric_categories << [completion, test, c_and_m, vcs]
rubric_2 = FactoryBot.create(:rubric_template)
rubric_2.rubric_categories << [completion, test, c_and_m, oop]
rubric_3 = FactoryBot.create(:rubric_template)
rubric_3.rubric_categories << [completion, test, rails, ar, schema]
rubric_4 = FactoryBot.create(:rubric_template)
rubric_4.rubric_categories << [completion, test, rails, ar, api]
rubric_5 = FactoryBot.create(:rubric_template)
rubric_5.rubric_categories << [completion, test, code, oop, p_and_p]
rubric_6 = FactoryBot.create(:rubric_template)
rubric_6.rubric_categories << [completion, test, code, oop]
rubric_7 = FactoryBot.create(:rubric_template)
rubric_7.rubric_categories << [completion, test, ci_deploy, stretch, agile, docs]
#FE rubric templates
rubric_8 = FactoryBot.create(:rubric_template)
rubric_8.rubric_categories << [completion, test, js, p_and_p]
rubric_9 = FactoryBot.create(:rubric_template)
rubric_9.rubric_categories << [completion, test, js, p_and_p, design]
rubric_10 = FactoryBot.create(:rubric_template)
rubric_10.rubric_categories << [completion, test, js, p_and_p, ui]
rubric_11 = FactoryBot.create(:rubric_template)
rubric_11.rubric_categories << [completion, test, react, p_and_p, routing]
rubric_12 = FactoryBot.create(:rubric_template)
rubric_12.rubric_categories << [completion, test, react, p_and_p, stretch]
rubric_13 = FactoryBot.create(:rubric_template)
rubric_13.rubric_categories << [completion, test, ci_deploy, ui, agile, docs]

# projects
#BE Mod 1 projects
war_and_peace = FactoryBot.create(:project_template, mod: "1", project_number: "1", rubric_template_id: rubric_1.id, name: "War and Peace", program: "BE", project_type: 0)
battleship = FactoryBot.create(:project_template, mod: "1", project_number: "2", rubric_template_id: rubric_1.id, name: "Battleship", program: "BE", project_type: 1)
mastermind = FactoryBot.create(:project_template, mod: "1", project_number: "2", rubric_template_id: rubric_1.id, name: "Mastermind", program: "BE", project_type: 1)
black_thursday = FactoryBot.create(:project_template, mod: "1", project_number: "3", rubric_template_id: rubric_2.id, name: "Black Thursday", program: "BE", project_type: 2)
futbol = FactoryBot.create(:project_template, mod: "1", project_number: "3", rubric_template_id: rubric_2.id, name: "Futbol", program: "BE", project_type: 2)
enigma = FactoryBot.create(:project_template, mod: "1", project_number: "4", rubric_template_id: rubric_2.id, name: "Enigma", program: "BE", is_final: true, project_type: 0)
nightwriter = FactoryBot.create(:project_template, mod: "1", project_number: "4", rubric_template_id: rubric_2.id, name: "Night Writer", program: "BE", is_final: true, project_type: 0)
#FE Mod 1
js_fun_library = FactoryBot.create(:project_template, mod: "1", project_number: "1", rubric_template_id: rubric_8.id, name: "JS Fun at the Library", program: "FE", project_type: 0)
rom_com = FactoryBot.create(:project_template, mod: "1", project_number: "2", rubric_template_id: rubric_8.id, name: "RomCom", program: "FE", project_type: 1)
intention = FactoryBot.create(:project_template, mod: "1", project_number: "3", rubric_template_id: rubric_8.id, name: "Intention Timer", program: "FE", project_type: 2)
tic_tac_toe = FactoryBot.create(:project_template, mod: "1", project_number: "4", rubric_template_id: rubric_9.id, name: "Tic Tac Toe", program: "FE", is_final: true, project_type: 0)
#BE Mod 2
relational = FactoryBot.create(:project_template, mod: "2", project_number: "1", rubric_template_id: rubric_3.id, name: "Relational Rails", program: "BE", project_type: 1)
adopt = FactoryBot.create(:project_template, mod: "2", project_number: "2", rubric_template_id: rubric_3.id, name: "Adopt don't Shop", program: "BE", project_type: 0)
black_rails = FactoryBot.create(:project_template, mod: "2", project_number: "3", rubric_template_id: rubric_4.id, name: "Black Thursday on Rails", program: "BE", project_type: 2)
discounts = FactoryBot.create(:project_template, mod: "2", project_number: "4", rubric_template_id: rubric_3.id, name: "Bulk Discounts", program: "BE", is_final: true, project_type: 0)
#FE Mod 2
js_fun = FactoryBot.create(:project_template, mod: "2", project_number: "1", rubric_template_id: rubric_10.id, name: "JSFun", program: "FE", project_type: 0)
fit = FactoryBot.create(:project_template, mod: "2", project_number: "2", rubric_template_id: rubric_10.id, name: "FitLit", program: "FE", project_type: 1)
game_time = FactoryBot.create(:project_template, mod: "2", project_number: "3", rubric_template_id: rubric_10.id, name: "Game Time", program: "FE", project_type: 2)
travel_tracker = FactoryBot.create(:project_template, mod: "2", project_number: "4", rubric_template_id: rubric_10.id, name: "Travel Tracker", program: "FE", is_final: true, project_type: 0)
#BE Mod 3
viewing_party = FactoryBot.create(:project_template, mod: "3", project_number: "1", rubric_template_id: rubric_6.id, name: "Relational Rails", program: "BE", project_type: 0)
black_api_edition = FactoryBot.create(:project_template, mod: "3", project_number: "2", rubric_template_id: rubric_4.id, name: "Black Thursday API Edition", program: "BE", project_type: 1)
consultancy = FactoryBot.create(:project_template, mod: "3", project_number: "3", rubric_template_id: rubric_5.id, name: "Consultancy", program: "BE", project_type: 2)
weather = FactoryBot.create(:project_template, mod: "3", project_number: "4", rubric_template_id: rubric_5.id, name: "Sweater Weather", program: "BE", is_final: true, project_type: 0)
#FE Mod 3
tomatillos = FactoryBot.create(:project_template, mod: "3", project_number: "1", rubric_template_id: rubric_11.id, name: "Rancid Tomatillos", program: "FE", project_type: 0)
stretch = FactoryBot.create(:project_template, mod: "3", project_number: "2", rubric_template_id: rubric_11.id, name: "Stretch", program: "FE", project_type: 1)
niche_audience = FactoryBot.create(:project_template, mod: "3", project_number: "3", rubric_template_id: rubric_11.id, name: "Niche Audience", program: "FE", project_type: 2)
ideas = FactoryBot.create(:project_template, mod: "3", project_number: "4", rubric_template_id: rubric_12.id, name: "Ideas-4-Ideaboxes", program: "FE", is_final: true, project_type: 0)
#Mod 4
capstone_be = FactoryBot.create(:project_template, mod: "4", project_number: "1", rubric_template_id: rubric_7.id, name: "Capstone", program: "BE", project_type: 2, is_final: true)
capstone_fe = FactoryBot.create(:project_template, mod: "4", project_number: "1", rubric_template_id: rubric_13.id, name: "Capstone", program: "FE", project_type: 2, is_final: true)

# Be 1 Mod 1 Project 1
profiles_mod1_be.each do |student|
  FactoryBot.create(:student_project, student_id: student, project_template_id: war_and_peace.id, student_comments: nil)
  FactoryBot.create(:student_project, student_id: student, project_template_id: battleship.id, student_comments: nil)
  FactoryBot.create(:student_project, student_id: student, project_template_id: black_thursday.id, student_comments: nil)
end
profiles_mod2_be.each do |student|
  FactoryBot.create(:student_project, student_id: student, project_template_id: war_and_peace.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: battleship.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: black_thursday.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: enigma.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: relational.id, student_comments: nil)
  FactoryBot.create(:student_project, student_id: student, project_template_id: adopt.id, student_comments: nil)
  FactoryBot.create(:student_project, student_id: student, project_template_id: black_rails.id, student_comments: nil)
end
profiles_mod3_be.each do |student|
  FactoryBot.create(:student_project, student_id: student, project_template_id: war_and_peace.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: battleship.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: black_thursday.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: enigma.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: relational.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: adopt.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: black_rails.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: discounts.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: viewing_party.id, student_comments: nil)
  FactoryBot.create(:student_project, student_id: student, project_template_id: black_api_edition.id, student_comments: nil)
  FactoryBot.create(:student_project, student_id: student, project_template_id: consultancy.id, student_comments: nil)
end
profiles_mod4_be.each do |student|
  FactoryBot.create(:student_project, student_id: student, project_template_id: war_and_peace.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: battleship.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: black_thursday.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: enigma.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: relational.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: adopt.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: black_rails.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: discounts.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: viewing_party.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: black_api_edition.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: consultancy.id, student_comments: nil)
  FactoryBot.create(:student_project, student_id: student, project_template_id: weather.id, student_comments: nil)
  FactoryBot.create(:student_project, student_id: student, project_template_id: capstone_be.id, student_comments: nil)
end

profiles_mod1_fe.each do |student|
  FactoryBot.create(:student_project, student_id: student, project_template_id: js_fun_library.id, student_comments: nil)
  FactoryBot.create(:student_project, student_id: student, project_template_id: rom_com.id, student_comments: nil)
  FactoryBot.create(:student_project, student_id: student, project_template_id: intention.id, student_comments: nil)
end

profiles_mod2_fe.each do |student|
  FactoryBot.create(:student_project, student_id: student, project_template_id: js_fun_library.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: rom_com.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: intention.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: tic_tac_toe.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: js_fun.id, student_comments: nil)
  FactoryBot.create(:student_project, student_id: student, project_template_id: fit.id, student_comments: nil)
  FactoryBot.create(:student_project, student_id: student, project_template_id: game_time.id, student_comments: nil)
end

profiles_mod3_fe.each do |student|
  FactoryBot.create(:student_project, student_id: student, project_template_id: js_fun_library.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: rom_com.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: intention.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: tic_tac_toe.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: js_fun.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: fit.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: game_time.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: travel_tracker.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: tomatillos.id, student_comments: nil)
  FactoryBot.create(:student_project, student_id: student, project_template_id: stretch.id, student_comments: nil)
  FactoryBot.create(:student_project, student_id: student, project_template_id: niche_audience.id, student_comments: nil)
end

profiles_mod4_fe.each do |student|
  FactoryBot.create(:student_project, student_id: student, project_template_id: js_fun_library.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: rom_com.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: intention.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: tic_tac_toe.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: js_fun.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: fit.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: game_time.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: travel_tracker.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: tomatillos.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: stretch.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: niche_audience.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: ideas.id)
  FactoryBot.create(:student_project, student_id: student, project_template_id: capstone_fe.id, student_comments: nil)
end

be_instr_ids = [[122, 123, 124], [116, 117, 118], [112, 113], [106, 107, 108, 109]]
# BE Mod 1 project feedback for students in Mod 2+
StudentProject
.joins(:project_template, user: :user_profile)
.where("project_templates.mod = '1' and project_templates.program = 'BE'")
.where.not("user_profiles.current_cohort = '2105'")
.each do |project|
  project.rubric_template_categories.each do |category|
    FactoryBot.create(:project_feedback, instructor_id: be_instr_ids[0].sample, project_id: project.id, rubric_template_category_id: category.id)
  end
end
# BE Mod 1 project feedback for students in Mod 1
[1, 2, 3].each do |n|
  StudentProject
  .joins(:project_template, user: :user_profile)
  .where("project_templates.mod = '1' and project_number = '#{n}' and project_templates.program = 'BE'")
  .where("user_profiles.current_cohort = '2105'")
  .each do |project|
    project.rubric_template_categories.each do |category|
      FactoryBot.create(:project_feedback, instructor_id: be_instr_ids[0].sample, project_id: project.id, rubric_template_category_id: category.id)
    end
  end
end
# BE Mod 2 project feedback for students in Mod 3+
StudentProject
.joins(:project_template, user: :user_profile)
.where("project_templates.mod = '2' and project_templates.program = 'BE'")
.where.not("user_profiles.current_cohort = '2103'")
.each do |project|
  project.rubric_template_categories.each do |category|
    FactoryBot.create(:project_feedback, instructor_id: be_instr_ids[1].sample, project_id: project.id, rubric_template_category_id: category.id)
  end
end
# BE Mod 2 project feedback for students in Mod 2
[1, 2, 3].each do |n|
  StudentProject
  .joins(:project_template, user: :user_profile)
  .where("project_templates.mod = '2' and project_number = '#{n}' and project_templates.program = 'BE'")
  .where("user_profiles.current_cohort = '2103'")
  .each do |project|
    project.rubric_template_categories.each do |category|
      FactoryBot.create(:project_feedback, instructor_id: be_instr_ids[1].sample, project_id: project.id, rubric_template_category_id: category.id)
    end
  end
end
# BE Mod 3 project feedback for students in Mod 4+
StudentProject
.joins(:project_template, user: :user_profile)
.where("project_templates.mod = '3' and project_templates.program = 'BE'")
.where.not("user_profiles.current_cohort = '2102'")
.each do |project|
  project.rubric_template_categories.each do |category|
    FactoryBot.create(:project_feedback, instructor_id: be_instr_ids[2].sample, project_id: project.id, rubric_template_category_id: category.id)
  end
end
# BE Mod 3 project feedback for students in Mod 3
[1, 2, 3].each do |n|
  StudentProject
  .joins(:project_template, user: :user_profile)
  .where("project_templates.mod = '3' and project_number = '#{n}' and project_templates.program = 'BE'")
  .where("user_profiles.current_cohort = '2102'")
  .each do |project|
    project.rubric_template_categories.each do |category|
      FactoryBot.create(:project_feedback, instructor_id: be_instr_ids[2].sample, project_id: project.id, rubric_template_category_id: category.id)
    end
  end
end
# BE Mod 4 project feedback for students in Mod 4
StudentProject
.joins(:project_template, user: :user_profile)
.where("project_templates.mod = '4' and project_templates.program = 'BE'")
.each do |project|
  project.rubric_template_categories.each do |category|
    FactoryBot.create(:project_feedback, instructor_id: be_instr_ids[3].sample, project_id: project.id, rubric_template_category_id: category.id)
  end
end

fe_instr_ids = [[119, 120, 121], [114, 115], [110, 111], [106, 107, 108, 109]]
# FE Mod 1 project feedback for students in Mod 2+
StudentProject
.joins(:project_template, user: :user_profile)
.where("project_templates.mod = '1' and project_templates.program = 'FE'")
.where.not("user_profiles.current_cohort = '2105'")
.each do |project|
  project.rubric_template_categories.each do |category|
    FactoryBot.create(:project_feedback, instructor_id: fe_instr_ids[0].sample, project_id: project.id, rubric_template_category_id: category.id)
  end
end
# FE Mod 1 project feedback for students in Mod 1
[1, 2, 3].each do |n|
  StudentProject
  .joins(:project_template, user: :user_profile)
  .where("project_templates.mod = '1' and project_number = '#{n}' and project_templates.program = 'FE'")
  .where("user_profiles.current_cohort = '2105'")
  .each do |project|
    project.rubric_template_categories.each do |category|
      FactoryBot.create(:project_feedback, instructor_id: fe_instr_ids[0].sample, project_id: project.id, rubric_template_category_id: category.id)
    end
  end
end
# FE Mod 2 project feedback for students in Mod 3+
StudentProject
.joins(:project_template, user: :user_profile)
.where("project_templates.mod = '2' and project_templates.program = 'FE'")
.where.not("user_profiles.current_cohort = '2103'")
.each do |project|
  project.rubric_template_categories.each do |category|
    FactoryBot.create(:project_feedback, instructor_id: fe_instr_ids[1].sample, project_id: project.id, rubric_template_category_id: category.id)
  end
end
# FE Mod 2 project feedback for students in Mod 2
[1, 2, 3].each do |n|
  StudentProject
  .joins(:project_template, user: :user_profile)
  .where("project_templates.mod = '2' and project_number = '#{n}' and project_templates.program = 'FE'")
  .where("user_profiles.current_cohort = '2103'")
  .each do |project|
    project.rubric_template_categories.each do |category|
      FactoryBot.create(:project_feedback, instructor_id: fe_instr_ids[1].sample, project_id: project.id, rubric_template_category_id: category.id)
    end
  end
end
# FE Mod 3 project feedback for students in Mod 4+
StudentProject
.joins(:project_template, user: :user_profile)
.where("project_templates.mod = '3' and project_templates.program = 'FE'")
.where.not("user_profiles.current_cohort = '2102'")
.each do |project|
  project.rubric_template_categories.each do |category|
    FactoryBot.create(:project_feedback, instructor_id: fe_instr_ids[2].sample, project_id: project.id, rubric_template_category_id: category.id)
  end
end
# FE Mod 3 project feedback for students in Mod 3
[1, 2, 3].each do |n|
  StudentProject
  .joins(:project_template, user: :user_profile)
  .where("project_templates.mod = '3' and project_number = '#{n}' and project_templates.program = 'FE'")
  .where("user_profiles.current_cohort = '2102'")
  .each do |project|
    project.rubric_template_categories.each do |category|
      FactoryBot.create(:project_feedback, instructor_id: fe_instr_ids[2].sample, project_id: project.id, rubric_template_category_id: category.id)
    end
  end
end
# FE Mod 4 project feedback for students in Mod 4
StudentProject
.joins(:project_template, user: :user_profile)
.where("project_templates.mod = '4' and project_templates.program = 'FE'")
.each do |project|
  project.rubric_template_categories.each do |category|
    FactoryBot.create(:project_feedback, instructor_id: fe_instr_ids[3].sample, project_id: project.id, rubric_template_category_id: category.id)
  end
end
# reset pk sequences to current max value
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end
