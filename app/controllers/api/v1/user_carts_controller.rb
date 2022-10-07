class Api::V1::UserCartsController < ApplicationController

  before_action :authenticate_request

  def index
    @cart = UserCart.includes(glass:[:frame, :lens]).where({user_id:@current_user['user_id']})
    @converter = MoneyService.new()
    @user_currency = params.fetch("currency")
  end

end
