Rails.application.routes.draw do
  resources :users, :projects

  get '/', to: 'index#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/home', to: 'projects#home'
  get '/config', to: 'projects#avatar'

end
