class Api::V1::InstructorStudentsController < ApplicationController
  def index
    return render_error("Required parameter missing") if missing_params(required_index)
    render_success(StudentSerializer.new(instructor.get_students(params[:mod])))
  end

  def search
    return render_error("Required parameter missing") if missing_name_params(required_search)
    return render_error("Invalid search parameters") if invalid_name_search
    students = UserProfile.find_students(params[:first_name], params[:last_name]) if instructor
    render_success(StudentSerializer.new(students))
  end

  private

  def required_index
    [:instructor_id, :mod]
  end

  def required_search
    [:instructor_id]
  end
end
