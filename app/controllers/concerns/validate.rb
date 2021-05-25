module Validate
  def missing_params(required)
    !required.all? {|key| params.has_key?(key)}
  end

  def validate_params
    params.permit(:id, :student_id, :instructor_id, :mod, :project_number,
                  :last_name, :first_name)
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

  def validate_number(key, value)
    error = "#{key.titleize} parameter is missing or invalid"
    render_error(error) if invalid_number(value)
  end

  def invalid_number(value)
    return true if value.empty?
    return true if value.to_i == 0
    return true if (value.to_i < 0 || value.to_i > 4)
  end

  def missing_name_params(required)
    !required.all? {|key| params.has_key?(key)} ||
    (!params.has_key?(:first_name) && !params.has_key?(:last_name))
  end

  def invalid_name_search
    return true if ((!params[:first_name].nil? && params[:first_name].length == 1) ||
    (!params[:last_name].nil? && params[:last_name].length == 1))
  end
end
