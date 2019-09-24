Rails.application.routes.draw do
  root 'toppage#index'
  get '/mypage', to: 'mypage#index'
end
