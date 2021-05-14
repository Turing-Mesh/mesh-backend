require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'validations' do
    it {should validate_presence_of :mod}
    it {should validate_presence_of :program}
  end

  describe 'relationships' do
    it {should belong_to(:user).with_foreign_key(:student_id)}
    it {should have_many :project_feedbacks}
  end
end
