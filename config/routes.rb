Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      get '/backgrounds', to: 'backgrounds#index'
      get '/forecast', to: 'forecast#index'
    end
  end
end
