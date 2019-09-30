Rails.application.routes.draw do
  resources :signup, only: :create
  get '/sell', to: 'sell#index'
  get '/sell/products', to: 'sell#products'
  get '/signup', to: 'signup#index'
  get '/signup/registration', to: 'signup#registration'
  get '/signup/sms_confirmation', to: 'signup#sms_confirmation'
  get '/signup/sms_confirmation/sms', to: 'signup#sms_confirmation_sms'
  get '/signup/address', to: 'signup#address'
  get '/signup/credit_card', to: 'signup#credit_card'
  get '/signup/done', to: 'signup#done'
  get '/login', to: 'signup#login'
  devise_for :users
  root 'toppage#index'
  get 'toppage/buydetails'
  get 'toppage/itembuy'
  get 'mypage/identification'
  get '/mypage', to: 'mypage#index'
  get 'mypage/card'
  get '/mypage/card/create', to: 'mypage#card_create'
  get '/mypage/profile', to: 'mypage#profile'
  get '/logout', to: 'mypage#logout'
end
