class StudentProject < ApplicationRecord
  belongs_to :project_template
  belongs_to :user, foreign_key: :student_id
  has_many :project_feedbacks, foreign_key: :project_id

  validates_presence_of :student_id, :project_template_id
end
