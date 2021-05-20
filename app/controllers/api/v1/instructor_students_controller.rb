class Api::V1::InstructorStudentsController < ApplicationController
  def index
    return json_response({data: "Invalid Query Parameters"}, 400) unless params.has_key?(:mod)
    instructor = User.find(params[:instructor_id])
    json_response(StudentSerializer.new(instructor.get_students(params[:mod])))
  end

  def show
    instructor = User.find(params[:instructor_id]).user_profile
    students = instructor.find_students(params[:first_name], params[:last_name])
    json_response(StudentSerializer.new(students))
  end
end


