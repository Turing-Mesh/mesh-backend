# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_15_220528) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "instructor_students", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "instructor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_feedbacks", force: :cascade do |t|
    t.bigint "instructor_id"
    t.bigint "project_id"
    t.bigint "project_rubric_id"
    t.float "score"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instructor_id"], name: "index_project_feedbacks_on_instructor_id"
    t.index ["project_id"], name: "index_project_feedbacks_on_project_id"
    t.index ["project_rubric_id"], name: "index_project_feedbacks_on_project_rubric_id"
  end

  create_table "project_rubrics", force: :cascade do |t|
    t.string "mod"
    t.string "program"
    t.string "project_number"
    t.bigint "rubric_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rubric_category_id"], name: "index_project_rubrics_on_rubric_category_id"
  end

  create_table "project_templates", force: :cascade do |t|
    t.bigint "rubric_template_id"
    t.string "name"
    t.string "mod"
    t.string "program"
    t.string "project_number"
    t.integer "project_type"
    t.boolean "is_final", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rubric_template_id"], name: "index_project_templates_on_rubric_template_id"
  end

  create_table "rubric_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rubric_templates", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_projects", force: :cascade do |t|
    t.string "instructor_comments"
    t.string "student_comments"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "project_template_id"
    t.index ["project_template_id"], name: "index_student_projects_on_project_template_id"
    t.index ["student_id"], name: "index_student_projects_on_student_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "first_name"
    t.string "last_name"
    t.string "current_mod"
    t.string "program"
    t.string "starting_cohort"
    t.string "current_cohort"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.integer "role"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "project_feedbacks", "project_rubrics"
  add_foreign_key "project_feedbacks", "student_projects", column: "project_id"
  add_foreign_key "project_feedbacks", "users", column: "instructor_id"
  add_foreign_key "project_rubrics", "rubric_categories"
  add_foreign_key "project_templates", "rubric_templates"
  add_foreign_key "student_projects", "project_templates"
  add_foreign_key "student_projects", "users", column: "student_id"
  add_foreign_key "user_profiles", "users"
end
