class CreateProjectFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :project_feedbacks do |t|
      t.references :instructor, references: :users, foreign_key: {to_table: :users}
      t.references :project, foreign_key: true
      t.references :project_rubric, foreign_key: true
      t.float :score
      t.string :comment

      t.timestamps
    end
  end
end
