class User < ApplicationRecord
  has_many :projects, foreign_key: :student_id
  validates :email, :role, presence: true
  validates_uniqueness_of :email

  enum role: ["student", "instructor"]
  has_secure_password
end
