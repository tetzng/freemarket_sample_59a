class MypageController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pulldown

  def identification
  end

  def index
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

  private
  # プルダウン用カテゴリー
  def set_pulldown
    @main_categories = Category.where(sub: '0')
    @sub_categories = Category.where(sub: params[:parent], sub_sub: '0') - Category.where(sub: '0')
    @sub_sub_categories = Category.where(sub: params[:child], sub_sub: params[:grandChild]) - Category.where(sub_sub: '0')
  end
end
