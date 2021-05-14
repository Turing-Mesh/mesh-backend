require 'rails_helper'

RSpec.describe ProjectFeedback, type: :model do
  describe 'validations' do
    it {should validate_presence_of :score}
  end

  describe 'relationships' do
    it {should belong_to :project}
    it {should belong_to :project_rubric}
    it {should belong_to(:user).with_foreign_key(:instructor_id)}
  end
end
