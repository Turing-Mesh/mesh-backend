class InstructorStudent < ApplicationRecord
  belongs_to :student, class_name: 'User'
  belongs_to :instructor, class_name: 'User'

  validate :cannot_instruct_self

  private

  def cannot_instruct_self
    errors.add(:student_id, 'Instructor_id and student_id cannot be the same.') if student_id == instructor_id
  end
end
