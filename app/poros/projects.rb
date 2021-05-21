class Projects
  attr_reader :id,
              :mod,
              :student_projects

  def initialize(data)
    @id = data[:student_id]
    @mod = data[:mod]
    @student_projects = get_student_projects(data)
  end

  private

  def get_student_projects(data)
    if data[:student_comments]
      projects = StudentProject.where(id: data[:id], student_id: data[:student_id])
    else
      projects = StudentProject.student_projects_by_mod(@id, @mod.to_s)
    end
    projects.map { |project| StudentProjects.new(project) } if !projects.empty?
  end
end
