Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => 'pages#home'

  ## User signup
  resources :users, :only => [:new, :create]

  ## User login

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  ## User

  get '/dashboard' => 'users#dashboard'

end
