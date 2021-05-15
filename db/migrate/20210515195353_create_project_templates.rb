class CreateProjectTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :project_templates do |t|
      t.references :rubric_template, foreign_key: true
      t.string :name
      t.string :mod
      t.string :program
      t.string :project_number
      t.integer :type
      t.boolean :is_final, default: false

      t.timestamps
    end
  end
end
