class ApplicationController < ActionController::API
  include Response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_record

  def render_not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def render_invalid_record(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def render_error(error, status = :bad_request)
    render json: { message: "your request cannot be completed", error: error}, status: status
  end

  private

  def validate_id
    id = :"#{params.keys.grep(/id/)[0]}"
    error = "String not accepted as id"
    render_error(error) if params[id].to_i == 0
  end

  def validate_mod
    error = "Mod parameter is missing or invalid"
    render_error(error) if invalid_mod
  end

  def invalid_mod
    return true if params[:mod].nil?
    return true if params[:mod].empty?
    return true if params[:mod].to_i == 0
    return true if (params[:mod].to_i < 0 || params[:mod].to_i > 4)
  end

  def validate_project
    error = "Project_number parameter is missing or invalid"
    render_error(error) if invalid_project
  end

  def invalid_project
    return true if params[:project_number].nil?
    return true if params[:project_number].empty?
    return true if params[:project_number].to_i == 0
    return true if (params[:project_number].to_i < 0 || params[:project_number].to_i > 4)
  end
end
