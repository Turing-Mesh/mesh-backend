class CreateRubricTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :rubric_templates do |t|

      t.timestamps
    end
  end
end
