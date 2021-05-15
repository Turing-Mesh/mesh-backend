class UpdateStudentProjectsColumns < ActiveRecord::Migration[5.2]
  def change
    add_reference :student_projects, :project_template, foreign_key: true
    remove_column :student_projects, :name
    remove_column :student_projects, :mod
    remove_column :student_projects, :program
  end
end
