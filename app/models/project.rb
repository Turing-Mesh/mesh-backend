class Project < ApplicationRecord
  belongs_to :user, foreign_key: :student_id

  validates_presence_of :mod, :program
end
