Rails.application.routes.draw do
  devise_for :users

  resources :card, only: [:new, :show] do
    collection do
      post 'show'
      post 'pay'
      post 'delete'
    end
  end

  resources :signup, only: [:index, :create] do
    collection do
      get 'registration'
      get 'sms_confirmation'
      get 'sms_confirmation/sms', to: 'signup#sms_confirmation_sms'
      get 'address'
      get 'credit_card'
      get 'done'
      post 'pay'
    end
  end

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

  # 商品検索ページ
  resources 'search',only: :index

  resources :mypage, only: [:index] do
    collection do
      get 'identification'
      get 'profile'
      get 'listing/listing', to: 'mypage#product_status'
      get 'listing/in_progress', to: 'mypage#product_in_progress'
      get 'listing/completed', to: 'mypage#product_completed'
      get 'logout', to: 'mypage#logout'
    end
    resources :sell, only: [:edit, :destroy] do
      collection do
        get 'change_status', to: 'sell#change_status'
      end
    end
  end
end
