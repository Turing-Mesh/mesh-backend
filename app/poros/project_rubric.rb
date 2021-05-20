class ProjectRubric
  attr_reader :id,
              :student_id,
              :project_template_id,
              :mod,
              :project_number,
              :rubric_template

  def initialize(params)
    student = UserProfile.find_by(user_id: params[:instructor_student_id])
    project = ProjectTemplate.get_project(student.program, params[:mod], params[:project_number]) # fix
    rubric_template = RubricTemplate.find(project[0].rubric_template_id)
    categories = rubric_template.rubric_template_categories
    @id = project[0].id
    @student_id = student.user.id
    @project_template_id = project[0].id
    @mod = student.current_mod
    @project_number = project[0].project_number
    @rubric_template = print_rubric(categories)
  end


  private
    def print_rubric(categories)
      categories.map do |category|
        Rubric.new(category)
      end
    end

end