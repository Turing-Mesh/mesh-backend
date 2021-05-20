class Rubric
  attr_reader :rubric_category_template_id,
              :rubric_category_name

  def initialize(category)
    @rubric_category_template_id = category.id
    @rubric_category_name = category.rubric_category.name
  end
end
