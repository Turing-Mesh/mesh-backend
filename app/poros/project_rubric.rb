class ProjectRubric
  attr_reader :id,
              :student_id,
              :project_template_id,
              :mod,
              :project_number,
              :rubric_template

  def initialize(student, project, categories)
    @id = project.id
    @student_id = student.id
    @project_template_id = project.project_template_id
    @mod = student.user_profile.current_mod
    @project_number = project.project_number
    @rubric_template = print_rubric(categories)
  end


  private
    def print_rubric(categories)
      categories.map do |category|
        Rubric.new(category)
      end
    end
end