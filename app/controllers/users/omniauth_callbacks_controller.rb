# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    @user = User.find_for_oauth(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in @user
      redirect_to root_path
    else
      session[:nickname]            = request.env['omniauth.auth'].info.name
      session[:provider_data]       = request.env['omniauth.auth'].except('extra')
      session[:email]               = request.env['omniauth.auth'].info.email
      session[:uid]                 = request.env['omniauth.auth'].uid
      session[:provider]            = request.env['omniauth.auth'].provider
      session[:token]               = request.env['omniauth.auth'].credentials.token
      session[:password]            = Devise.friendly_token[0, 20]
      redirect_to signup_registration_path
    end
  end
end
