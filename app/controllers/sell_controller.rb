class SellController < ApplicationController
  def index
    @product = Sell.new
  end

  def create
    @product = Sell.new(product_params)
    @product.save
    redirect_to root_path
  end

  private
  def product_params
    params.permit(:image, :name, :)
    # require(:product).permit(:name, images: [])
    params.permit(:image, :name, :description, :category_id, :condition_id, :size_id, :brand, :delivery_charge, :delivery_way, :delivery_area, :delivery_days, :price, :status)
  end

  def move_to_index
    redirect_to :action => 'index' unless user_signed_in?
  end
end 
