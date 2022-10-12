Rails.application.routes.draw do
  root 'top#main'
  resources :users, only: %i[index]
  resources :tweets, only: %i[index new create]
  resources :likes, only: %i[create destroy]
  
  post 'top/login'
  get  'top/pre_signin'
  post 'top/signin'
  post 'top/logout'
end
