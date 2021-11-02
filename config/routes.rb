Rails.application.routes.draw do
  get 'admin/login'
  post 'admin/login'
  get 'admin/logout'
  resources :companies
  resources :employees
  
  # root "hello#index"
  
  get "/hello", to: "hello#index"
  resources :libraries
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home/index'
  get 'home/welcome'
  get 'form/index'
end
