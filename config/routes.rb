Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root 'sessions#index'
get '/signup' => 'users#new'
get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
#doesnt allow users to type in /logout only used as a link
delete '/logout' => 'sessions#destroy'
resources :users
resources :games

end
