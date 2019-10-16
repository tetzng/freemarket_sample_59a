class PurchaseController < ApplicationController
  before_action :set_product, only: [:show, :pay, :done]
  before_action :set_user, only: [:show, :done]
  before_action :address_info, only: [:done]
  before_action :full_name, only: [:done]
  before_action :authenticate_user!

  require 'payjp'
  Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)

  def show
    card = Card.find_by(user_id: current_user.id)
    @address_info = Prefecture.find(current_user.prefecture_id).name + current_user.city + current_user.address1 + current_user.address2
    @full_name = current_user.last_name + current_user.first_name
    if not user_signed_in?
      redirect_to new_user_session_path
    elsif card.blank?
      redirect_to controller: 'card', action: 'new'
    else
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = Card.find_by(user_id: current_user.id)
    Payjp::Charge.create(
    amount: @product.price, #支払金額を入力（itemテーブル等に紐づけても良い）
    customer: card.customer_id, #顧客ID
    currency: 'jpy', #日本円
    )
    @product.update(status_id: 4)
    redirect_to action: 'done' #完了画面に移動
  end

  def done
    card = Card.find_by(user_id: current_user.id)
    customer = Payjp::Customer.retrieve(card.customer_id)
    @default_card_information = customer.cards.retrieve(card.card_id)
  end

  private
  # 商品情報
  def set_user
    @user = User.find(@product.user_id)
  end

  # ユーザー情報
  def set_product
    @product = Product.find(params[:sell_id])
  end

  # ログインユーザーの住所
  def address_info
    @address_info = Prefecture.find(current_user.prefecture_id).name + current_user.city + current_user.address1 + current_user.address2
  end

  # ログインユーザーのフルネーム
  def full_name
    @full_name = current_user.last_name + current_user.first_name
  end
end