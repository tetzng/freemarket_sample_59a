Rails.application.routes.draw do
  devise_for :users
  resources :signup, only: :create
  resources :sell
  get '/sell', to: 'sell#index'
  get '/signup', to: 'signup#index'
  get '/signup/registration', to: 'signup#registration'
  get '/signup/sms_confirmation', to: 'signup#sms_confirmation'
  get '/signup/sms_confirmation/sms', to: 'signup#sms_confirmation_sms'
  get '/signup/address', to: 'signup#address'
  get '/signup/credit_card', to: 'signup#credit_card'
  get '/signup/done', to: 'signup#done'
  get '/login', to: 'signup#login'
  root 'sell#index'
  get 'sell/buydetails'
  get 'mypage/identification'
  get '/mypage', to: 'mypage#index'
  get 'mypage/card'
  get '/mypage/card/create', to: 'mypage#card_create'
  get '/mypage/profile', to: 'mypage#profile'
  get '/logout', to: 'mypage#logout'

  
  resources :users

  devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks', 
    sessions: 'users/sessions'
  }
  resources :signup do
    collection do
      get  '/'               => 'signup#new'
      get  'step1'           => 'signup#step1'
      get  'step2'           => 'signup#step2'
      get  'step3'           => 'signup#step3'
      post 'signup/create'   => 'signup#create'
    end
  end
  # get  'users/auth/facebook',     to: 'users/omniauth_callbacks#passthru', via: [:get, :post], as: :user_facebook_omniauth_authorize_path
  # match  'signup/facebook/callback', to: 'users/omniauth_callbacks#callback', via: [:get, :post]
  # get    'signup/facebook',          to: 'users/omniauth_callbacks#new',                          as: :new_user_facebook_omniauth_registration
  # post   'signup/facebook',          to: 'users/omniauth_callbacks#create',                       as: :create_user_facebook_omniauth_registration
  # # resources :users


end
