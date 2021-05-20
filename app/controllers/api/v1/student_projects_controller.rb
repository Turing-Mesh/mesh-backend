class Api::V1::StudentProjectsController < ApplicationController
  before_action :validate_id, only: [:index, :update]
  before_action :validate_mod, only: :index

  def index
    student = User.find(params[:student_id])
    projects = Projects.new(params)
    json_response(ProjectsSerializer.new(projects))
  end

  def update
    project = StudentProject.find_by(id: params[:id], student_id: params[:student_id])
    if project.nil?
      User.find(params[:student_id])
      StudentProject.find(params[:id])
      error = "The student id and project id provided are not a valid combination"
      render_error(error)
    elsif !params.keys.include?("student_comments")
      error = "Student comments missing, it must be included in request body"
      render_error(error)
    else
      project.update(student_comments_params)
      params[:mod] = project.project_template.mod
      projects = Projects.new(params)
      json_response(ProjectsSerializer.new(projects))
    end
  end

  private

  def student_comments_params
    params.permit(:student_comments)
  end
end
