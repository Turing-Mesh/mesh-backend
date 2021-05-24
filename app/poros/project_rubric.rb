class ProjectRubric
  attr_reader :id,
              :student_id,
              :mod,
              :project_number,
              :rubric_template

  def initialize(params)
    @project ||= get_project(params)
    @id = @project.id
    @student_id = params[:student_id].to_i
    @mod = params[:mod]
    @project_number = @project.project_number
    @rubric_template = print_rubric(RubricTemplate.find(@project.rubric_template_id).rubric_template_categories)
  end


  private
    def print_rubric(categories)
      categories.map do |category|
        Rubric.new(category)
      end
    end

    def get_project(data)
      ProjectTemplate.get_project(student(data).program, data[:mod], data[:project_number])
    end

    def student(data)
      UserProfile.find_by(user_id: data[:student_id])
    end

end
