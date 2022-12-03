Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'application#root'
  resources :demo, only: :index
  resources :sample, only: :index do
    collection do
      get :sample
    end
  end
end
