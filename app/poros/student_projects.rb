class StudentProjects
  attr_reader :id,
              :name,
              :program,
              :project_number,
              :project_type,
              :is_final_project,
              :average_score,
              :instructor_comments,
              :student_comments,
              :project_feedback

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @program = data[:program]
    @project_number = data[:project_number]
    @project_type = data.project_template.project_type
    @is_final_project = data[:is_final_project]
    @average_score = data.average_feedback_score
    @instructor_comments = data[:instructor_comments]
    @student_comments = format_comments(data[:student_comments])
    @project_feedback = get_project_feedback(data)
  end

  def get_project_feedback(data)
    data.project_feedbacks.map do |feedback|
      {
        id: feedback.id,
        rubric_category_name: feedback.rubric_category.name,
        score: feedback.score,
        comment: feedback.comment
      }
    end
  end

  def format_comments(data)
    [data.split("/2C/")].to_a.flatten if !data.nil?
  end
end
