class CreateModRubrics < ActiveRecord::Migration[5.2]
  def change
    create_table :mod_rubrics do |t|
      t.string :mod
      t.string :program
      t.string :project_number
      t.references :rubric_category, foreign_key: true

      t.timestamps
    end
  end
end
