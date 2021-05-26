class ProjectFeedback < ApplicationRecord
  belongs_to :user, foreign_key: :instructor_id
  belongs_to :student_project, foreign_key: :project_id
  belongs_to :rubric_template_category
  has_one :rubric_category, through: :rubric_template_category

  validates_presence_of :score

  def self.create_feedback(project, params)
    params[:project_feedback].each do |feedback|
      create!(
        instructor_id: params[:instructor_id].to_i,
        project_id: project.id,
        rubric_template_category_id: feedback[:rubric_template_category_id],
        score: feedback[:score],
        comment: feedback[:comment]
      )
    end
  end
end
