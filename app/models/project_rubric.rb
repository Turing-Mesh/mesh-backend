class ProjectRubric < ApplicationRecord
  belongs_to :rubric_category

  validates_presence_of :mod, :program, :project_number
  validates_uniqueness_of :rubric_category_id, scope: [:mod, :program, :project_number]
end
