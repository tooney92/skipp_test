class Api::V1::LensesController < ApplicationController

  before_action :authenticate_request
  before_action :admin?, only: :create

  def index
    @lenses = Lens.page(params.fetch(:page))
    @converter = MoneyService.new()
    @user_currency = params.fetch("currency")
  end

  def create
    @lens = Lens.new(lens_params)
    if @lens.save
      render status: :created
    else
      render json: @lens.errors, status: :unprocessable_entity
    end
  end

  private

  def lens_params
    params.require(:lens).permit(:name, :description, :status, :stock, :color, :lens_type, :prescription_type,
                                 :price)
  end
end
