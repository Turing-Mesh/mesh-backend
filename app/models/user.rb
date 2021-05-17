class User < ApplicationRecord
  has_many :student_projects, foreign_key: :student_id
  has_many :project_feedbacks, foreign_key: :instructor_id

  has_many  :instructor_users,
            foreign_key: :student_id,
            class_name: 'InstructorStudent',
            dependent: :destroy
  has_many  :instructors, through: :instructor_users
  has_many  :student_users,
            foreign_key: :instructor_id,
            class_name: 'InstructorStudent',
            dependent: :destroy
  has_many  :students, through: :student_users

  validates :email, :role, presence: true
  validates_uniqueness_of :email
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  enum role: [:student, :instructor]
  has_secure_password

  has_one :user_profile

  def get_students(mod_num)
      students.map do |student|
        student.user_profile if student.user_profile.current_mod == mod_num
      end.compact
  end
end
