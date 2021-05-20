class Api::V1::ProjectTemplatesController < ApplicationController
  def index
    student = User.find(params[:instructor_student_id])
    project_rubric = ProjectRubric.new(params)
    json_response(ProjectRubricSerializer.new(project_rubric))
  end
end