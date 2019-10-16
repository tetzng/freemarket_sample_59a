class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_categories

  protected
  def configure_permitted_parameters
    added_attrs = [ :nickname,
                    :first_name,
                    :last_name,
                    :first_name_kana,
                    :last_name_kana,
                    :birthday_year,
                    :birthday_month,
                    :birthday_day,
                    :phone_num,
                    :authentication_num,
                    :content
                  ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

  private
  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def set_categories
    @main_category = Category.where(sub: '0')
    @categories = Category.where(sub: params[:id], sub_sub: params[:sub_sub])
    @sub_sub_categories = Category.where(sub: params[:sub_sub], sub_sub: params[:sub] )
  end
end