module Response
  def render_success(object, status = :ok)
    render json: object, status: status
  end

  def render_exception(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def render_error(error, status = :bad_request)
    render json: { message: "your request cannot be completed", error: error}, status: status
  end
end
