Rails.application.routes.draw do

  namespace :api do
   namespace :v1 do
    resources :holes
    resources :matches
    get 'matches/holes/:id', to: 'matches#match_holes'
    get 'users/:username', to: 'users#find_user'
    get 'users/find_multiple_users/:playerList', to: 'users#find_multiple_users'
    post 'users/login', to: 'users#login'
    resources :users

end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
