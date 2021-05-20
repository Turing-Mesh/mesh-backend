class Api::V1::ProjectTemplatesController < ApplicationController
  def index
    require "pry"; binding.pry
    student = User.find(params[:instructor_student_id])
    project = StudentProject.get_project(student.id, params[:mod], params[:project_number])[0]
    rubric_template = RubricTemplate.find(project.rubric_template_id)
    categories = rubric_template.rubric_template_categories
    project_rubric = ProjectRubric.new(student, project, categories)
    json_response(ProjectRubricSerializer.new(project_rubric))
  end
end