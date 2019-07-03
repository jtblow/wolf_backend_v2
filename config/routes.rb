Rails.application.routes.draw do

  namespace :api do
   namespace :v1 do

    get 'matches/holes/:id', to: 'matches#match_holes'
    get 'users/:username', to: 'users#find_user'
    get 'matches/users/:id', to: 'matches#match_users'
    get 'users/find_multiple_users/:playerList', to: 'users#find_multiple_users'
      get 'users/matches/:id', to: 'users#user_matches'
    post 'users/login', to: 'users#login'

    resources :holes
    resources :matches
    resources :users

end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
