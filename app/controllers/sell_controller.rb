class SellController < ApplicationController
  

  def index
    @product = Sell.new
  end
<<<<<<< HEAD

  def create
    @product = Sell.new(product_params)
    @product.save
    redirect_to root_path
  end

  private

  def product_params
    params.permit(:image, :name, :)
    
  end

  def move_to_index
    redirect_to :action => 'index' unless user_signed_in?
  end

end 
=======
  # require(:product).permit(:name, images: [])
end
>>>>>>> create products active hash
