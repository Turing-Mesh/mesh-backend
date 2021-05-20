class Api::V1::StudentProjectsController < ApplicationController
  before_action :validate_id, only: :index
  before_action :validate_mod, only: :index

  def index
    student = User.find(params[:student_id])
    projects = Projects.new(params)
    json_response(ProjectsSerializer.new(projects))
  end

  def update
    project = StudentProject.find_by(id: params[:id], student_id: params[:student_id])
    params[:mod] = project.project_template.mod
    if project.update(student_comments_params)
      projects = Projects.new(params)
      json_response(ProjectsSerializer.new(projects))
    end
  end

  private

  def student_comments_params
    params.permit(:student_comments)
  end
end
