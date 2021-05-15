require 'rails_helper'

RSpec.describe StudentProject, type: :model do
  describe 'validations' do
    it {should validate_presence_of :student_id}
    it {should validate_presence_of :project_template_id}
  end

  describe 'relationships' do
    it {should belong_to(:project_template)}
    it {should belong_to(:user).with_foreign_key(:student_id)}
    it {should have_many(:project_feedbacks).with_foreign_key(:project_id)}
  end
end
