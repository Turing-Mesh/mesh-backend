class Api::V1::StudentProjectsController < ApplicationController
  before_action :validate_parameters, only: [:index, :update]

  def index
    return render_error("Required parameter missing") if missing_params(required_index)
    projects = Projects.new(params) if student
    render_success(ProjectsSerializer.new(projects))
  end

  def update
    return render_error("Required parameter missing") if missing_params(required_update)
    project = StudentProject.find_by!(id: params[:id], student_id: params[:student_id])
    project.update(student_comments)
    params[:mod] = project.project_template.mod
    projects = Projects.new(params)
    render_success(ProjectsSerializer.new(projects))
  end

  def create
    return render_error("Required parameter missing") if missing_params(required_create)
    project = StudentProject.new(student_project_params) if student && instructor
    if project.save
      ProjectFeedback.create_feedback(project, params) if !params[:project_feedback].nil?
      params[:mod] = project.project_template.mod
      params[:id] = project.id
      projects = Projects.new(params)
      EmailService.send_confirmation(student.email, project.id)
      render_success(ProjectsSerializer.new(projects))
      
    else
    end
  end

  private

  def required_index
    [:student_id, :mod]
  end

  def required_update
    [:student_id, :id, :student_comments]
  end

  def required_create
    [:instructor_id, :student_id, :project_template_id, :instructor_comments,
    :project_feedback]
  end

  def student_comments
    if params[:student_comments].nil?
      {student_comments: params[:student_comments]}
    elsif params[:student_comments].count > 1
      {student_comments: params[:student_comments].join("/2C/")}
    else
      {student_comments: params[:student_comments][0]}
    end
  end

  def student_project_params
    params.permit(:student_id, :project_template_id, :instructor_comments)
  end
end
