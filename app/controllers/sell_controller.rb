class SellController < ApplicationController
  before_action :set_product, only: [:show, :edit, :destroy]
  before_action :set_mypage_product, only: [:change_status]
  before_action :set_category, only: [:show, :edit, :change_status]
  before_action :set_condition, only: [:show, :edit, :change_status]
  before_action :set_prefecture, only: [:show, :edit, :change_status]
  before_action :set_delivery, only: [:show, :edit, :change_status]
  before_action :set_user, only: [:show, :edit, :change_status]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update]

  def index
    @products = Product.limit(10).order('created_at DESC')
    @category = Category.all
  end

  def new
    @product = Product.new
    @categories = Category.where(sub: params[:sub], sub_sub: params[:sub_sub])
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render '/sell/new' unless @product.valid?
    end
  end

  def show
    @my_product = Product.where(user_id: params[:id])
    @next_product = Product.where("id > ?", @product.id).order("id ASC").first
    @prev_product = Product.where("id < ?", @product.id).order("id DESC").first
  end

  def edit
    @product = Product.find(params[:id])
    @size = Size.find(@product.size_id)
    @images_length = @product.images.length
    @main_category = Category.where(sub: '0')
    @sub_category = Category.where(sub: "#{@smallcategory.sub}", sub_sub: '0')
    @sub_sub_category = Category.where(sub_sub: "#{@smallcategory.sub_sub}" )
  end

  def update
    product = Product.find(params[:id])
    if product.user_id == current_user.id
      product.update(product_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def change_status
  end

  def destroy
    if @product.user_id == current_user.id
      @product.destroy
      redirect_to listing_listing_mypage_index_path
    else
      redirect_to edit_sell_path
    end
  end

  private
  def product_params
    params.require(:product).permit( :name, :description, :category_id, :condition_id, :size_id, :brand, :delivery_charge_id, :delivery_way_id, :prefecture_id, :delivery_days_id, :price, images: []).merge(user_id: current_user.id)
  end

  # 商品情報
  def set_product
    @product = Product.find(params[:id])
  end

  # 商品情報編集
  def set_mypage_product
    @product = Product.find(params[:mypage_id])
  end

  # カテゴリー
  def set_category
    @smallcategory = Category.find(@product.category_id)
    @category = Category.find(Category.find(@product.category_id).sub_sub) unless Category.find(@product.category_id).sub_sub == '0'
    @bigcategory = Category.find(Category.find(@product.category_id).sub)
  end

  # 商品状態
  def set_condition
    @condition = Condition.find(@product.condition_id)
  end

  # 配送元地域
  def set_prefecture
    @prefecture = Prefecture.find(@product.prefecture_id)
  end

  # 発送日目安、配送方法、配送料の負担
  def set_delivery
    @delivery_charge = DeliveryCharge.find(@product.delivery_charge_id)
    @delivery_way = DeliveryWay.find(@product.delivery_way_id)
    @delivery_days = DeliveryDays.find(@product.delivery_days_id)
  end

  # ユーザー情報
  def set_user
    @user = User.find(@product.user_id)
  end

  # 本人のみ操作可能
  def correct_user
    @product = Product.find(params[:id])
    if @product.user_id != current_user.id
      redirect_to root_path
    end
  end
end
