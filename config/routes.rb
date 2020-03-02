Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'home/index'
  root "home#index"

  resources :quotes do
    resources :cities,   only: :show
    resources :services, only: [:show]
    resources :tours,    only: [:show]
  end

  resources :category

  resources :vendor

  resources :cities do
    resources :services
    resources :tours
  end

  resources :activities do
    resources :sub_activities
    resources :activity_options
  end

  resources :options do
    resources :prices
  end

  post "/quotes/:id/activities",      to: "activities#add_to_quote"
  post "/quotes/:id/calculate_cost",  to: "quotes#cost"
  post "/activities/calculate_cost",  to: "activities#calculate_cost"



end
