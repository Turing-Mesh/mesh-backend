require 'rails_helper'

RSpec.describe ProjectRubric, type: :model do
  describe 'validations' do
    it {should validate_presence_of :mod}
    it {should validate_presence_of :program}
    it {should validate_presence_of :project_number}
  end

  describe 'validations' do
    it "rubric_category_id is unique to mod, program and project_number" do
      category = create(:rubric_category, id: 1)
      valid_1 = ProjectRubric.new(mod: "1", program: "BE", project_number: "1", rubric_category_id: category.id)

      expect(valid_1.save).to eq(true)
      invalid_1 = ProjectRubric.new(mod: "1", program: "BE", project_number: "1", rubric_category_id: category.id)

      expect(invalid_1.save).to eq(false)
      valid_2 = ProjectRubric.new(mod: "1", program: "BE", project_number: "2", rubric_category_id: category.id)

      expect(valid_2.save).to eq(true)
    end
  end

  describe 'relationships' do
    it {should belong_to :rubric_category}
  end
end
