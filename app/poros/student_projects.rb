class StudentProjects
  attr_reader :id,
              :name,
              :program,
              :project_number,
              :project_type,
              :is_final_project,
              :instructor_comments,
              :student_comments

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @program = data[:program]
    @project_number = data[:project_number]
    @project_type = data.project_template.project_type
    @is_final_project = data[:is_final]
    @instructor_comments = data[:instructor_comments]
    @student_comments = data[:student_comments]
    @data = data
  end

  def project_feedback
    @data.project_feedbacks.map do |feedback|
      {
        id: feedback.id,
        rubric_category_name: feedback.rubric_category.name,
        score: feedback.score,
        comment: feedback.comment
      }
    end
  end
end
