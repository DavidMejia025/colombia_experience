Rails.application.routes.draw do
  get 'home/index'
  root "home#index"

  resources :quotes do

    resources :cities
    resources :activities
  end

  resources :cities do
    resources :activities
  end

  resources :activities do
    resources :sub_activities
    resources :activity_options
  end

  resources :sub_activities do
    resources :activity_options
  end

  post "/quotes/:id/activities",      to: "activities#add_to_quote"
  post "/quotes/:id/calculate_cost",  to: "quotes#cost"
  post "/activities/calculate_cost",  to: "activities#calculate_cost"



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
