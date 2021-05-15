require 'rails_helper'

RSpec.describe RubricTemplateCategory, type: :model do
  describe 'validations' do
    it {should validate_presence_of :rubric_category_id}
    it {should validate_presence_of :rubric_template_id}
  end

  describe 'validations' do
    it 'validates rubric_category_id is unique for rubric_template_id' do
      create(:rubric_template_category)
      should validate_uniqueness_of(:rubric_category_id).scoped_to(:rubric_template_id)
    end
  end
  describe 'relationships' do
    it {should belong_to :rubric_category}
    it {should belong_to :rubric_template}
  end
end
