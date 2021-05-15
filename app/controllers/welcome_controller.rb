class WelcomeController < ApplicationController
  def show
    render json: {data: "ok"}, status: 200
  end
end
