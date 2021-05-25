class Api::V1::ProjectTemplatesController < ApplicationController
  before_action :validate_parameters, only: :index

  def index
    return render_error("Required parameter missing") if missing_params(required_index)
    student = User.find_by!(id: params[:student_id])
    instructor = User.find_by!(id: params[:instructor_id], role: 'instructor')
    project_rubric = ProjectRubric.new(params)
    render_success(ProjectRubricSerializer.new(project_rubric))
  end

  def required_index
    [:student_id, :instructor_id, :mod, :project_number]
  end
end
