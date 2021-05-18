class Api::V1::StudentProjectsController < ApplicationController
  before_action :validate_id, only: :index
  before_action :validate_mod, only: :index

  def index
    student = User.find(params[:student_id])
    projects = Projects.new(params)
    json_response(ProjectsSerializer.new(projects))
  end
end
