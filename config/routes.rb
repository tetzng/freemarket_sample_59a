Rails.application.routes.draw do
  root 'toppage#index'
  get 'mypage/index'
end
