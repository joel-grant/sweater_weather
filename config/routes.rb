Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/backgrounds', to: 'backgrounds#index'
      get '/forecast', to: 'forecast#index'
    end
  end
end
