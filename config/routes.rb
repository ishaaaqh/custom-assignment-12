Rails.application.routes.draw do
  get 'blogs/index'
  devise_for :users
  root to: "blogs#index"
  get 'myblogs', to: 'blogs#userblogs' 
  resources :blogs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
