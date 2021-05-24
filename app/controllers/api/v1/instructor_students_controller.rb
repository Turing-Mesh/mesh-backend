class Api::V1::InstructorStudentsController < ApplicationController
  def index
    return json_response({data: "Invalid Query Parameters"}, 400) unless params.has_key?(:mod)
    instructor = User.find(params[:instructor_id])
    json_response(StudentSerializer.new(instructor.get_students(params[:mod])))
  end

  def search
    return json_response({data: "Invalid Query Parameters"}, 400) if (!params.has_key?(:first_name) && !params.has_key?(:last_name) )
    return json_response({data: "Invalid Search Terms"}, 400) if ((!params[:first_name].nil? && params[:first_name].length == 1) ||
                                                                  (!params[:last_name].nil? && params[:last_name].length == 1) )
    instructor = User.find(params[:instructor_id]).user_profile
    students = UserProfile.find_students(params[:first_name], params[:last_name])
    json_response(StudentSerializer.new(students))
  end
end
