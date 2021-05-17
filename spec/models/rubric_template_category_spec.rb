require 'rails_helper'

RSpec.describe RubricTemplateCategory, type: :model do
  describe 'validations' do
    it {should validate_presence_of :rubric_category_id}
    it {should validate_presence_of :rubric_template_id}
  end

  describe 'validations' do
    it 'validates rubric_category_id is unique for rubric_template_id' do
      rubric_template = create(:rubric_template)
      rubric_category = create(:rubric_category)
      create(:rubric_template_category, rubric_template_id: rubric_template.id, rubric_category_id: rubric_category.id)
      should validate_uniqueness_of(:rubric_category_id).scoped_to(:rubric_template_id)
    end
  end
  describe 'relationships' do
    it {should belong_to :rubric_category}
    it {should belong_to :rubric_template}
  end
end
