class UserProfile < ApplicationRecord
  belongs_to :user
  validates :first_name,
            :last_name,
            :program,
            :current_mod,
            :starting_cohort,
            :current_cohort,
            presence: true

  enum status: [:enrolled, :graduated, :withdrawn, :on_leave]

end
