class Api::V1::StudentProjectsController < ApplicationController
  before_action :validate_parameters, only: [:index, :update]

  def index
    return render_error("Required parameter missing") if missing_params(required_index)
    student = User.find(params[:student_id])
    projects = Projects.new(params)
    render_success(ProjectsSerializer.new(projects))
  end

  def update
    return render_error("Required parameter missing") if missing_params(required_update)
    project = StudentProject.find_by!(id: params[:id], student_id: params[:student_id])
    if project.update(student_comments_params)
      params[:mod] = project.project_template.mod
      projects = Projects.new(params)
      render_success(ProjectsSerializer.new(projects))
    end
  end

  def required_index
    [:student_id, :mod]
  end

  def required_update
    [:student_id, :id, :student_comments]
  end

  def student_comments_params
    params.permit(:student_comments)
  end
end
