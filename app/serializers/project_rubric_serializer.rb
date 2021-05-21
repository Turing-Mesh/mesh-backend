class ProjectRubricSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :student_id,
              :project_template_id,
              :mod,
              :project_number,
              :rubric_template
end