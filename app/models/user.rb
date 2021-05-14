class User < ApplicationRecord
  validates :email, :role, presence: true
  validates_uniqueness_of :email

  enum role: ["student", "instructor"]
  has_secure_password
end
