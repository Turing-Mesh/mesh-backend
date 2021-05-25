class ApplicationController < ActionController::API
  include Response

  rescue_from ActiveRecord::RecordNotFound, with: :render_exception
  rescue_from ActiveRecord::RecordInvalid, with: :render_exception

  private

  def validate_params
    params.permit(:id,
                  :student_id,
                  :instructor_id,
                  :mod,
                  :project_number,
                  :last_name,
                  :first_name)
  end

  def missing_params(required)
    !required.all? {|key| params.has_key?(key)}
  end

  def validate_parameters
    validate_params.each do |key, value|
      validate_id(key, value) if key.include?("id")
      validate_number(key, value) if key == "mod"
      validate_number(key, value) if key == "project_number"
    end
  end

  def validate_id(key, value)
    error = "String not accepted as id"
    render_error(error) if value.to_i == 0
  end

  # def validate_id
  #   keys = params.keys.find_all {|key| key.include?("id")}
  #   keys.each do |key|
  #     id = :"#{key}"
  #     error = "String not accepted as id"
  #     render_error(error) if params[id].to_i == 0
  #   end
  # end

  def validate_number(key, value)
    # require "pry"; binding.pry
    error = "#{key.titleize} parameter is missing or invalid"
    render_error(error) if invalid_number(value)
  end

  def invalid_number(value)
    # require "pry"; binding.pry
    return true if value.empty?
    return true if value.to_i == 0
    return true if (value.to_i < 0 || value.to_i > 4)
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
end
