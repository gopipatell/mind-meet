Rails.application.routes.draw do
  # get 'meetings/new'
  # get 'meetings/create'
  # get 'meetings/edit'
  # get 'meetings/delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => 'pages#home'
  get '/error/unauthorised' => 'pages#error403'

  ## Signup
  resources :users, :only => [:new, :create]

  ## Login
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  ## User
  get '/dashboard' => 'users#dashboard'

  ## Meeting
  resources :meetings, :only => [:new, :create, :edit,:update, :show, :destroy] do
    resources :actions, :only => [:create, :destroy]
  end

  ## Action
  put '/actions/:id/complete' => 'actions#complete', as: 'complete_action'

end
