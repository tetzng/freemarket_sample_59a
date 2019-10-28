class CardController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pulldown, only: [:new, :show]

  require 'payjp'
  Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)

  def new
    redirect_to action: 'show' if current_user.card.present?
  end

  def pay #payjpとCardのデータベース作成を実施します。
    if params['payjp-token'].blank?
      redirect_to action: 'new'
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token']
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: 'show'
      else
        redirect_to action: 'pay'
      end
    end
  end

  def delete #PayjpとCardデータベースを削除します
    card = Card.find_by(user_id: current_user.id)
    if card.blank?
    else
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
    redirect_to new_card_path
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    card = Card.find_by(user_id: current_user.id)
    if card.blank?
      redirect_to action: 'new'
    else
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  private
    # プルダウン用カテゴリー
    def set_pulldown
      @main_categories = Category.where(sub: '0')
      @sub_categories = Category.where(sub: params[:parent], sub_sub: '0') - Category.where(sub: '0')
      @sub_sub_categories = Category.where(sub: params[:child], sub_sub: params[:grandChild]) - Category.where(sub_sub: '0')
      respond_to do |format|
        format.html
        format.json
      end
    end
  
end
