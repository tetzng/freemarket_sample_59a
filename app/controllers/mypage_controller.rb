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
    @products = Product.where( user_id: current_user.id, status_id: '1')
  end

  def product_in_progress
    @products = Product.where( user_id: current_user.id, status_id: '2')
  end

  def product_completed
    @products = Product.where( user_id: current_user.id, status_id: '4')
  end
end
