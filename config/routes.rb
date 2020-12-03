Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
resources :games
root 'sessions#home'
get '/signup' => 'users#new'
get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
#doesnt allow users to type in /logout only used as a link
delete '/logout' => 'sessions#destroy'
get '/auth/facebook/callback' => 'sessions#fbcreate'

resources :users
resources :profiles 

resources :games do
  resources :profiles, only: [:new, :index]
end

end
