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

  resource :category

  resource :vendor

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
  get  "/quotes/:id/services/:id/add_quote_service",      to: "quotes#add_quote_service", as: "quote_tour_service"
  delete "/quotes/:id/services/:id/remove_quote_service", to: "quotes#delete_quote_service", as: "quote_tour_remove_service"
  get "/quotes/:id/calculate_cost",                       to: "quotes#calculate_cost"

  post "/quotes/:id/tours",                               to: "tours#create_quote_tour"
  post "/quotes/:id/tours/:id/",                          to: "tours#index_quote_tour"
  get  "/quotes/:id/tours/:id/services",                  to: "tours#quote_tour_services",   as: "quote_tour_services"
  delete "/quotes/:id/tours/:id/remove_quote_tour",       to: "tours#delete_quote_tour", as: "quote_remove_tour"

  #get "/quotes/:id/tours/:id/services/:id/add_service",  to: "services#new_quote_tour_services"

  post "/cities/:id/tours/:id/select_new_service",      to: "tours#select_new_service"
  post "/cities/:id/tours/:id/select_category_service", to: "tours#select_category_service"
  post "/cities/:id/tours/:id/select_vendor_service",   to: "tours#select_vendor_service"
  post "/cities/:id/tours/:id/select_service",          to: "tours#select_service"

  post "/cities/:id/add_quote_service",   to: "cities#add_quote_service"
  post "/cities/:id/add_quote_option",    to: "cities#add_quote_option"
  post "/cities/:id/add_quote_price",     to: "cities#add_quote_price"
end
