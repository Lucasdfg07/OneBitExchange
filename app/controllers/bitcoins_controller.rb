class BitcoinsController < ApplicationController
  def index
  end

  def convert
    value = BitcoinService.new(params[:target_currency], params[:amount]).perform
    render json: {value: value}
  end
end
