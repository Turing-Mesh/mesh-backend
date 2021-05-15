class RubricCategory < ApplicationRecord
  has_many :rubric_template_categories

  validates_presence_of :name
end
