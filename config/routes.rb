Rails.application.routes.draw do
  resources :books do
    collection do
      get :updateLib
    end
  end
  devise_for :users
  resources :libs
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
  root "libs#index"
  
end
