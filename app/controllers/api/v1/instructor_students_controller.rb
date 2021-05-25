class Api::V1::InstructorStudentsController < ApplicationController
  def index
    return render_error("Invalid Query Parameters") unless params.has_key?(:mod)
    instructor = User.find(params[:instructor_id])
    render_success(StudentSerializer.new(instructor.get_students(params[:mod])))
  end

  def search
    return render_error("Invalid Query Parameters") if (!params.has_key?(:first_name) && !params.has_key?(:last_name) )
    return render_error("Invalid Search Terms") if ((!params[:first_name].nil? && params[:first_name].length == 1) ||
                                                                  (!params[:last_name].nil? && params[:last_name].length == 1))
    instructor = User.find(params[:instructor_id]).user_profile
    students = UserProfile.find_students(params[:first_name], params[:last_name])
    render_success(StudentSerializer.new(students))
  end
end
