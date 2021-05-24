class Api::V1::ProjectTemplatesController < ApplicationController
  before_action :validate_mod, only: :index
  before_action :validate_id, only: :index
  before_action :validate_project, only: :index

  def index
    student = User.find(params[:student_id])
    instructor = User.find(params[:instructor_id])
    project_rubric = ProjectRubric.new(params)
    json_response(ProjectRubricSerializer.new(project_rubric))
  end
end
