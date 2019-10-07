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
    @products = current_user.products
  end
end
