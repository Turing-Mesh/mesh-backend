class UpdateProjectTemplates < ActiveRecord::Migration[5.2]
  def change
    rename_column :project_templates, :type, :project_type
  end
end
