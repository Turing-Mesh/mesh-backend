class RenameProjectsToStudentProjects < ActiveRecord::Migration[5.2]
  def change
    rename_table :projects, :student_projects
  end
end
