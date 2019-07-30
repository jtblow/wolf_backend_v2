Rails.application.routes.draw do

  namespace :api do
   namespace :v1 do

    get 'matches/holes/:id', to: 'matches#match_holes'
    get 'users/:id/matches/holes/:id', to: 'users#user_match_holes'
    get 'users/:username', to: 'users#find_user'
    get 'matches/users/:id', to: 'matches#match_users'
    get 'users/find_multiple_users_by_name/:playerNameList', to: 'users#find_multiple_users_by_name'
    get 'users/find_multiple_users_by_id/:playerIDList', to: 'users#find_multiple_users_by_id'
    get 'users/matches/:id', to: 'users#user_matches'


    resources :holes
    resources :matches

    resources :users, only: [:create]
    post '/login', to: 'auth#create'
    get '/profile', to: 'users#profile'


end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
