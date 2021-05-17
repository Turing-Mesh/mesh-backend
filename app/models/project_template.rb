class ProjectTemplate < ApplicationRecord
  belongs_to :rubric_template
  has_many :student_projects

  validates :name, :mod, :program, :project_number, presence: true

  enum project_type: [:solo, :paired, :team]
end
