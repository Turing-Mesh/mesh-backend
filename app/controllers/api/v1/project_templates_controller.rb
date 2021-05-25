class Api::V1::ProjectTemplatesController < ApplicationController
  before_action :validate_parameters, only: :index

  def index
    return render_error("Required parameter missing") if missing_params(required_index)
    project_rubric = ProjectRubric.new(params) if student && instructor
    render_success(ProjectRubricSerializer.new(project_rubric))
  end

  private

  def required_index
    [:student_id, :instructor_id, :mod, :project_number]
  end
end
