require 'rails_helper'

RSpec.describe RubricCategory, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :rubric_template_categories}
  end
end
