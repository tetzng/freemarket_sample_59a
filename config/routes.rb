Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'toppage#index'
  get '/mypage_profile', to: 'mypage_profile#index'
end
