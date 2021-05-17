class StudentProject < ApplicationRecord
  belongs_to :project_template
  belongs_to :user, foreign_key: :student_id
  has_many :project_feedbacks, foreign_key: :project_id

  validates_presence_of :student_id, :project_template_id

  def self.student_projects_by_mod(id, mod)
    select('student_projects.*,
      project_templates.name,
      project_templates.mod,
      project_templates.program,
      project_templates.project_number,
      project_templates.project_type,
      project_templates.is_final,
      project_templates.rubric_template_id')
    .joins(:project_template)
    .where('student_projects.student_id = ?', id)
    .where('project_templates.mod = ?', mod)
    .order('project_templates.project_number')
  end
end
