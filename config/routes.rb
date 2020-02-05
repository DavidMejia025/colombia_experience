Rails.application.routes.draw do
  resources :quotes do
    resources :cities
    resources :activities
  end

  resources :cities do
    resources :activities
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
