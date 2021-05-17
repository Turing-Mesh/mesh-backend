class RenameColumnOnProjectFeedbacks < ActiveRecord::Migration[5.2]
  def change
    rename_column :project_feedbacks, :project_rubric_id, :rubric_template_category_id
  end
end
