Rails.application.routes.draw do
  root 'toppage#index'
  get 'toppage/buydetails'
  get 'mypage/identification'
  get '/mypage', to: 'mypage#index'
  get '/mypage/profile', to: 'mypage#profile'
end
