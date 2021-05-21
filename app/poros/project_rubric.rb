class ProjectRubric
  attr_reader :id,
              :student_id,
              :project_template_id,
              :mod,
              :project_number,
              :rubric_template

  def initialize(params)
    @id = project(params)[0].id
    @student_id = student(params).user.id
    @project_template_id = project(params)[0].id
    @mod = student(params).current_mod
    @project_number = project(params)[0].project_number
    @rubric_template = print_rubric(RubricTemplate.find(project(params)[0].rubric_template_id).rubric_template_categories)
  end


  private
    def print_rubric(categories)
      categories.map do |category|
        Rubric.new(category)
      end
    end

    def project(data)
      ProjectTemplate.get_project(student(data).program, data[:mod], data[:project_number])
    end

    def student(data)
      UserProfile.find_by(user_id: data[:instructor_student_id])
    end

end