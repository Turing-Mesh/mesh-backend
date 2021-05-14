class RubricCategory < ApplicationRecord
  has_many :mod_rubrics

  validates_presence_of :name
end
