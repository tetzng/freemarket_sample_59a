class PurchaseController < ApplicationController
  # 商品情報
  before_action :set_product, only: [:show, :pay, :done]
  # ユーザー情報
  before_action :set_user, only: [:show, :done]
  # ログインユーザーの住所
  before_action :address_info, only: [:done]

  require 'payjp'
  Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
  
  def show
    card = Card.where(user_id: current_user.id).first
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: 'card', action: 'new'
    else
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = Card.where(user_id: current_user.id).first
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

  def set_user
    @user = User.find(@product.user_id)
  end

  def set_product
    @product = Product.find(params[:sell_id])
  end

  def address_info
  @address_info = Prefecture.find(current_user.prefecture_id).name + current_user.city + current_user.address1 + current_user.address2
  end
end