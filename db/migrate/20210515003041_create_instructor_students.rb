class CreateInstructorStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :instructor_students do |t|
      t.bigint :student_id
      t.bigint :instructor_id

      t.timestamps
    end
  end
end
