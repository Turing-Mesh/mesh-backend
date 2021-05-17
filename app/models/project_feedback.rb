class ProjectFeedback < ApplicationRecord
  belongs_to :user, foreign_key: :instructor_id
  belongs_to :student_project, foreign_key: :project_id
  belongs_to :rubric_template_category
  has_one :rubric_category, through: :rubric_template_category

  validates_presence_of :score
end
