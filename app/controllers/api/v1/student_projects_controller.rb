class Api::V1::StudentProjectsController < ApplicationController
  def index
    projects = Projects.new(params)
    json_response(ProjectsSerializer.new(projects))
  end
end
