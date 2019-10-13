class MypageController < ApplicationController
  def index
  end
  def identification
  end
  def profile
  end
  def logout
  end

  # 出品中
  def product_status
    @products = Product.where( user_id: current_user.id, status_id: [1, 2, 3])
  end

  # 取引中
  def product_in_progress
    @products = Product.where( user_id: current_user.id, status_id: 4)
  end

  # 売却済み
  def product_completed
    @products = Product.where( user_id: current_user.id, status_id: 5)
  end
end
