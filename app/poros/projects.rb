class Projects
  attr_reader :id,
              :mod,
              :student_projects

  def initialize(data)
    @id = data[:student_id]
    @mod = data[:mod]
    @student_projects = get_student_projects
  end

  def get_student_projects
    projects = StudentProject.student_projects_by_mod(@id, @mod.to_s)
    projects.map { |project| StudentProjects.new(project) } if !projects.empty?
  end
end
