class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :mod
      t.string :program
      t.string :instructor_comments
      t.string :student_comments
      t.references :student, references: :users, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
