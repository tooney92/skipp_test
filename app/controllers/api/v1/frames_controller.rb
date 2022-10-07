class Api::V1::FramesController < ApplicationController

  before_action :authenticate_request
  before_action :admin?, only: :create

  def index
    @frames = Frame.page(params.fetch(:page)).where(status: 'active')
    @converter = MoneyService.new()
    @user_currency = params.fetch("currency")
  end
  
  def create
    @frame = Frame.new(frame_params)
    if @frame.save
      render status: :created
    else
      render json: @frame.errors, status: :unprocessable_entity
    end
  end
  
  private 
  
  def frame_params
    params.require(:frame).permit(:name, :description, :status, :stock,
                                  :price)
  end
end
