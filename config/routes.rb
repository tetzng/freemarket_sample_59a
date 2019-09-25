Rails.application.routes.draw do
  devise_for :users
  root 'toppage#index'
  get '/mypage', to: 'mypage#index'
end
