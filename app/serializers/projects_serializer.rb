class ProjectsSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :mod, :student_projects

  attribute :project_feedback do |object|
    object.project_feedback
  end
end
