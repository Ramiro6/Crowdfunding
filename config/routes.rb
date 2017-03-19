Rails.application.routes.draw do
  resources :users, :projects
  get '/', to: 'index#index'
  get '/save', to: 'users#save'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/explore', to: 'projects#explore'

  get '/home/', to: 'projects#home'
  get '/show', to: 'projects#show'
  # get '/home/:project_id', to: 'projects#explore', as: :explore_path
  get '/home/:project_id/', to: 'projects#explore', as: :project_path
  # get '/home', to: 'projects#payment'
  post '/home/', to: 'projects#payment'
  # post '/home/', to: 'projects#explore'

  get '/config/:project_id', to: 'projects#edit'
  get '/config/', to: 'projects#new'

  get '/post', to: 'posts#new', as: :posts
  post '/post', to: 'posts#create'
  delete '/post/', to: 'posts#destroy'

end
