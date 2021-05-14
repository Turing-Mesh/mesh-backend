class Project < ApplicationRecord
  belongs_to :user, foreign_key: :student_id
  has_many :project_feedbacks

  validates_presence_of :mod, :program
end
