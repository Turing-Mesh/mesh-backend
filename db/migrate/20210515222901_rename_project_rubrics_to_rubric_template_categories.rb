class RenameProjectRubricsToRubricTemplateCategories < ActiveRecord::Migration[5.2]
  def change
    rename_table :project_rubrics, :rubric_template_categories
  end
end
