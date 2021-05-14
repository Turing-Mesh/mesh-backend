require 'rails_helper'

RSpec.describe ModRubric, type: :model do
  describe 'validations' do
    it {should validate_presence_of :mod}
    it {should validate_presence_of :program}
    it {should validate_presence_of :project_number}
  end

  describe 'relationships' do
    it {should belong_to :rubric_category}
  end
end
