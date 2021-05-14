class ModRubric < ApplicationRecord
  belongs_to :rubric_category

  validates_presence_of :mod
  validates_presence_of :program
  validates_presence_of :project_number
end
