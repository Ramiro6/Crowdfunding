Rails.application.routes.draw do
  resources :users, :projects

  get '/', to: 'index#index'
  get '/save', to: 'users#save'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/home', to: 'projects#home'
  get '/config/:project_id', to: 'projects#edit'
  get '/config/', to: 'projects#new'

end
