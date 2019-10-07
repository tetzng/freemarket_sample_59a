class MypageController < ApplicationController
  def identification
  end
  def index
  end
  def profile
  end
  def logout
  end
  def card
  end
  def card_create
  end

  def product_status
    @products = Product.where(user_id: current_user.id)
  end
end
