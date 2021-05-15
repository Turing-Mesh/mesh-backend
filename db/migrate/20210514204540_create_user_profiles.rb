class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :current_mod
      t.string :program
      t.string :starting_cohort
      t.string :current_cohort
      t.integer :status

      t.timestamps
    end
  end
end
