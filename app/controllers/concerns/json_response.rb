# helper for sending json response
module JsonResponse
  def json_error_response(error_message, status_code)
    render json: { errors: error_message }, status: status_code
  end

  def json_response(message, status_code)
    render json: { data: message }, status: status_code
  end
end
