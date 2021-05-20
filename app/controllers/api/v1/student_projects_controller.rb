class Api::V1::StudentProjectsController < ApplicationController
  before_action :validate_id, only: :index
  before_action :validate_mod, only: :index

  def index
    student = User.find(params[:student_id])
    projects = Projects.new(params)
    json_response(ProjectsSerializer.new(projects))
  end

  def update
    student = User.find(params[:student_id])
    project = StudentProject.find(params[:id])
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
