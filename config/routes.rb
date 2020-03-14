Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'home/index'
  root "home#index"

  resources :quotes do
    resources :cities,   only: :show
    resources :services, only: [:show, :new, :index]
    resources :tours,    only: [:show, :new, :index]
    resources :options,  only: [:show, :new, :index]
    resources :prices,   only: [:show, :new, :index]
  end

  resources :category

  resources :vendor

  resources :cities do
    resources :services
    resources :tours
  end

  resources :services do
    resources :options
  end

  resources :options do
    resources :prices
  end

  post "/quotes/:id/new_quote_services",  to: "services#new_quote_services"
  post "/quotes/:id/add_quote_service",   to: "quotes#add_quote_service"
  post "/quotes/:id/add_quote_option",    to: "quotes#add_quote_option"
  post "/quotes/:id/add_quote_price",     to: "quotes#add_quote_price"

  get "/quotes/:id/calculate_cost",  to: "quotes#calculate_cost"

  post "/quotes/:id/tours",       to: "tours#create_quote_tour"
  post "/quotes/:id/tours/:id/",  to: "tours#index_quote_tour"


  post "/cities/:id/tours/:id/select_new_service",      to: "tours#select_new_service"
  post "/cities/:id/tours/:id/select_category_service", to: "tours#select_category_service"
  post "/cities/:id/tours/:id/select_vendor_service",   to: "tours#select_vendor_service"
  post "/cities/:id/tours/:id/select_service",          to: "tours#select_service"

  post "/cities/:id/add_quote_service",   to: "cities#add_quote_service"
  post "/cities/:id/add_quote_option",    to: "cities#add_quote_option"
  post "/cities/:id/add_quote_price",     to: "cities#add_quote_price"
end
