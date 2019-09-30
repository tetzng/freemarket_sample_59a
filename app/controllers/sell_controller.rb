class SellController < ApplicationController

  def index
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path  
      
    else
      render :index
    end

  end

  private
  def product_params
    # params.permit(:image, :name, :)
    # require(:product).permit(:name, images: [])
    params.require(:product).permit( :name, :description, :category_id, :condition_id, :size_id, :brand, :delivery_charge_id, :delivery_way_id, :prefecture_id, :delivery_days_id, :price).merge(user_id: current_user.id)
  end

  # def move_to_index
  #   redirect_to :action => 'index' unless user_signed_in?
  # end
end
