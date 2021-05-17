class Projects
  attr_reader :id,
              :mod

  def initialize(data)
    @id = data[:student_id]
    @mod = data[:mod]
    @data = data
  end

  def student_projects
    projects = StudentProject.student_projects_by_mod(@id, @mod.to_s)
    projects.map do |project|
      StudentProjects.new(project)
    end
  end
end
