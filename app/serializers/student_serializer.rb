class StudentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :first_name, :last_name, :current_cohort
end
