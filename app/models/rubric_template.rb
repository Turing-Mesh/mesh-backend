class RubricTemplate < ApplicationRecord
  has_many :rubric_template_categories
  has_many :rubric_categories, through: :rubric_template_categories
end
