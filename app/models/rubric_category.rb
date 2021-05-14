class RubricCategory < ApplicationRecord
  has_many :project_rubrics

  validates_presence_of :name
end
