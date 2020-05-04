Rails.application.routes.draw do
  resources :posts
  resources :messages
  get '/images/:id', to: 'posts#show2'
  namespace :api do
      namespace :v1 do
      resources :messages
      resources :users
      resources :chat_rooms, only:  [:index,:show,:create,:destroy]
      resources :zodiac_matches, only: [:index, :show]
      get '/signup', to: 'users#new'
      post '/users' => 'users#create'
      post "/auth", to: 'auth#create'
      get '/current_user', to: 'auth#show'
    end
  end
end
