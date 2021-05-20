class ProjectsSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :mod, :student_projects
end
