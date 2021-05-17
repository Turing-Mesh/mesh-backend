class RubricTemplateCategory < ApplicationRecord
  belongs_to :rubric_category
  belongs_to :rubric_template

  validates_presence_of :rubric_category_id, :rubric_template_id
  validates_uniqueness_of :rubric_category_id, scope: :rubric_template_id
end
