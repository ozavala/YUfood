Rails.application.routes.draw do

  resources :meal_plans
  root 'pages#index'
  get 'pages/index'
  get 'pages/home'

end
