class ProjectTemplate < ApplicationRecord
  belongs_to :rubric_template
  has_many :student_projects

  validates :name, :mod, :program, :project_number, presence: true

  enum project_type: [:solo, :paired, :team]


  def self.get_project(program, mod, project_number)
    where('program = ?', program)
    .where('mod = ?', mod)
    .where('project_number = ?', project_number)
    .order(created_at: :desc)
    .limit(1)
    .first
  end
end
