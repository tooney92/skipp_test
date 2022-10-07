Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :frames, only: %i[index create]
      resources :lenses, only: %i[index create]
      resources :glasses, only: %i[create]
      resources :user_carts, only: %i[index]
      resources :users, only: %i[create]
      resource :auth, only: [] do
        post '/login', to: 'authentication#login'
      end
    end
  end
end
