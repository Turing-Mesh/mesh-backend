require 'rails_helper'

RSpec.describe ProjectRubric, type: :model do
  describe 'validations' do
    it {should validate_presence_of :mod}
    it {should validate_presence_of :program}
    it {should validate_presence_of :project_number}
    it {should validate_presence_of :rubric_category_id}
  end

  describe 'validations' do
    it "rubric_category_id is unique to mod, program and project_number" do
      rubric_1 = create(:project_rubric)
      # create a test for this, below is not working with mult scopes
      # should validate_uniqueness_of(:rubric_category_id).scoped_to(:mod, :project_number)
    end
  end

  describe 'relationships' do
    it {should belong_to :rubric_category}
  end
end
