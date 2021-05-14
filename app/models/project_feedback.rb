class ProjectFeedback < ApplicationRecord
  belongs_to :user, foreign_key: :instructor_id
  belongs_to :project
  belongs_to :project_rubric

  validates_presence_of :score
end
