Rails.application.routes.draw do
  resources :users

  devise_for :users, controllers: { 
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :card, only: [:new, :show] do
    collection do
      post 'show'
      post 'pay'
      post 'delete'
    end
  end

  resources :signup, only: :create
  resources :sell
  resources :users
  get '/sell/new_size', to: 'sell#new_size'
  resources :signup, only: :create
  resources :sell
  namespace :api do
    resources :sell, only: :new, defaults: { format: 'json' }
    get '/sell/new_delivery', to: 'sell#new_delivery', defaults: { format: 'json' }
  end
  get '/sell', to: 'sell#index'
  get '/signup', to: 'signup#index'
  get '/signup/registration', to: 'signup#registration'
  get '/signup/sms_confirmation', to: 'signup#sms_confirmation'
  get '/signup/sms_confirmation/sms', to: 'signup#sms_confirmation_sms'
  get '/signup/address', to: 'signup#address'
  get '/signup/credit_card', to: 'signup#credit_card'
  get '/signup/done', to: 'signup#done'

  resources :sell do
    resources :purchase, only: [:show] do
      collection do
        get 'show'
        post 'pay'
        get 'done'
      end
    end
  end

  namespace :api do
    resources :sell, only: :new, defaults: { format: 'json' }
    get '/sell/new_delivery', to: 'sell#new_delivery', defaults: { format: 'json' }
  end

  root 'sell#index'

  resources :mypage, only: [:index] do
    resources :sell, only: [:edit, :destroy] do
      collection do
        get 'change_status', to: 'sell#change_status'
      end
    end
  end

  get 'mypage/identification'
  get '/mypage', to: 'mypage#index'
  get '/mypage/profile', to: 'mypage#profile'
  get 'mypage/listing/listing', to: 'mypage#product_status'
  get 'mypage/listing/in_progress', to: 'mypage#product_in_progress'
  get 'mypage/listing/completed', to: 'mypage#product_completed'
  get '/logout', to: 'mypage#logout'

end
