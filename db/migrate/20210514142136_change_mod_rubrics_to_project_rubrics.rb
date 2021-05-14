class ChangeModRubricsToProjectRubrics < ActiveRecord::Migration[5.2]
  def change
    rename_table :mod_rubrics, :project_rubrics
  end
end
