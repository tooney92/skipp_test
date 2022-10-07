class Api::V1::GlassesController < ApplicationController

  before_action :authenticate_request

  def create
    lens = Lens.find_by_id!(glass_params['lens'])
    frame = Frame.find_by_id!(glass_params['frame'])
    glass_service = GlassService.new(lens, frame, @current_user['user_id'])
    glass_service.inventory_check
    return json_error_response(glass_service.errors, 422) unless glass_service.errors.empty?

    @glass = glass_service.create_glass
    render status: :created
  end

  private

  def glass_params
    params.require(:glass).permit(:frame, :lens)
  end
end
