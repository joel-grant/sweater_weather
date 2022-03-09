Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :sessions, only: [:create]
      resources :road_trip, only: [:create]
      get '/book-search', to: 'book_search#index'
      get '/backgrounds', to: 'backgrounds#index'
      get '/forecast', to: 'forecast#index'
    end
  end
end
