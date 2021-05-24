class ProjectRubricSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :student_id,
              :mod,
              :project_number,
              :rubric_template
end
