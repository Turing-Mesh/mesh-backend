require 'rails_helper'

RSpec.describe ProjectFeedback, type: :model do
  describe 'validations' do
    it {should validate_presence_of :score}
  end

  describe 'relationships' do
    it {should belong_to(:student_project).with_foreign_key(:project_id)}
    it {should belong_to :rubric_template_category}
    it {should belong_to(:user).with_foreign_key(:instructor_id)}
    it {should have_one(:rubric_category).through(:rubric_template_category)}
  end
end
