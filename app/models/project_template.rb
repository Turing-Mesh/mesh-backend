class ProjectTemplate < ApplicationRecord
  belongs_to :rubric_template

  validates :name, :mod, :program, :project_number, presence: true

  enum project_type: [:solo, :paired, :team]
end
