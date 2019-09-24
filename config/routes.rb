Rails.application.routes.draw do
  root 'toppage#index'
  get '/mypage', to: 'mypage#index'
  get '/mypage/profile', to: 'mypage#profile'
end
