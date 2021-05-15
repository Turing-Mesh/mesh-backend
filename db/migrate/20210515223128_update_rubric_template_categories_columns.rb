class UpdateRubricTemplateCategoriesColumns < ActiveRecord::Migration[5.2]
  def change
    add_reference :rubric_template_categories, :rubric_template, foreign_key: true
    remove_column :rubric_template_categories, :project_number
    remove_column :rubric_template_categories, :mod
    remove_column :rubric_template_categories, :program
  end
end
