class ApplicationController < ActionController::API

  include JsonWebToken
  include Auth
  include JsonResponse
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordNotUnique, with: :duplicate_record
  rescue_from ActionController::ParameterMissing, with: :missing_parameter

  private

  def record_not_found(error)
    json_error_response(error.message, 404)
  end

  def duplicate_record
    json_error_response('email already exists', 400)
  end

  def missing_parameter(error)
    json_error_response(error.message, 400)
  end

  def authenticate_request
    header = request.headers['Authorization']
    render json: { error: 'no token sent' }, status: :bad_request and return if header.nil?

    header = header.split(' ').last if header
    @current_user = jwt_decode(header)

  end
end
