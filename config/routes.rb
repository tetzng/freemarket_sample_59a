Rails.application.routes.draw do
  devise_for :users
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  resources :signup, only: :create
  get 'sell/buydetails', to: 'sell#buydetails'
  resources :sell do
    resources :purchase, only: [:show] do
      collection do
        get 'show', to: 'purchase#show'
        post 'pay', to: 'purchase#pay'
        get 'done', to: 'purchase#done'
      end
    end
  end
  get '/sell/new_size', to: 'sell#new_size'
  resources :signup, only: :create
  resources :sell
  namespace :api do
    resources :sell, only: :new, defaults: { format: 'json' }
    get '/sell/new_delivery', to: 'sell#new_delivery', defaults: { format: 'json' }
  end

  get '/signup', to: 'signup#index'
  get '/signup/registration', to: 'signup#registration'
  get '/signup/sms_confirmation', to: 'signup#sms_confirmation'
  get '/signup/sms_confirmation/sms', to: 'signup#sms_confirmation_sms'
  get '/signup/address', to: 'signup#address'
  get '/signup/credit_card', to: 'signup#credit_card'
  get '/signup/done', to: 'signup#done'
  root 'sell#index'

  resources :mypage, only: [:index] do
    resources :sell, only: [:edit] do
      collection do
        get 'change_status', to: 'sell#change_status'
      end
    end
  end
  
  get 'mypage/identification'
  get '/mypage', to: 'mypage#index'
  get 'mypage/card'
  get '/mypage/card/create', to: 'mypage#card_create'
  get '/mypage/profile', to: 'mypage#profile'
  get '/logout', to: 'mypage#logout'
  get 'mypage/listing', to: 'mypage#product_status'
end
