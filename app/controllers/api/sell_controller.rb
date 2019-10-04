class Api::SellController < ApplicationController
  def new
    @sizes = Size.where(group: params[:group])
  end
  def new_delivery
    @delivery_ways = DeliveryWay.where(charge: params[:charge])
  end
end