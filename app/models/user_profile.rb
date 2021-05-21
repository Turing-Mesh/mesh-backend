class UserProfile < ApplicationRecord
  belongs_to :user
  validates :first_name,
            :last_name,
            :program,
            :current_mod,
            presence: true

  enum status: [:enrolled, :graduated, :withdrawn, :on_leave]

  def self.find_students(first_name, last_name)
    select("first_name, last_name, current_cohort, user_id")
    .where("status = ? " , "0")
    .where("user_profiles.first_name ILIKE ? AND user_profiles.last_name ILIKE ? "  , "#{first_name||=""}%" ,  "#{last_name||=""}%" )
    .order(:first_name)
  end
end



