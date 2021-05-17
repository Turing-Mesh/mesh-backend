require 'rails_helper'

RSpec.describe RubricTemplate, type: :model do
  describe 'relationships' do
    it {should have_many :rubric_template_categories}
    it {should have_many(:rubric_categories).through(:rubric_template_categories)}
  end
end
