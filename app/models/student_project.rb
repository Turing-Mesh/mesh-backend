class StudentProject < ApplicationRecord
  belongs_to :project_template
  belongs_to :user, foreign_key: :student_id
  has_many :project_feedbacks, foreign_key: :project_id
  has_one :rubric_template, through: :project_template
  has_many :rubric_template_categories, through: :rubric_template

  validates_presence_of :student_id, :project_template_id

  def self.student_projects_by_mod(id, mod)
    select('student_projects.*,
      project_templates.name,
      project_templates.mod,
      project_templates.program,
      project_templates.project_number,
      project_templates.is_final as is_final_project,
      project_templates.rubric_template_id')
    .joins(:project_template)
    .where('student_projects.student_id = ?', id)
    .where('project_templates.mod = ?', mod)
    .order('project_templates.project_number')
  end

  def average_feedback_score
    project_feedbacks.average(:score)
  end
end
