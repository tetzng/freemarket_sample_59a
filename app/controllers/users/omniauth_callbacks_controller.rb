class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    @user = User.find_for_oauth(request.env['omniauth.auth'])
    first_password = request.env['omniauth.auth'].credentials.token.to_s
    second_password = request.env['omniauth.auth'].uid.to_s
    password = first_password[0, 4] + second_password[0, 4]
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
      session[:password]            = password
      redirect_to signup_registration_path
    end
  end
end
