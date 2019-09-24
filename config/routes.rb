Rails.application.routes.draw do
  root 'toppage#index'
  get 'mypage/index'
  get 'mypage/identification'
end
