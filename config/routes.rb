Rottenpotatoes::Application.routes.draw do

  resources :users, only: [:new, :create]
  get 'signup', to: 'users#new'
  get 'login', to: 'login_session#new'
  post 'login', to: 'login_session#create'
  delete 'logout', to: 'login_session#destroy'

  resources :recipes do
    collection do
      post :search, :action => 'search_index', :as => 'search_index'
      get 'search/:q', :action => 'search', :as => 'search'
      get 'page/:id', :action => 'page', :as => 'page'
      post :favorite, :action => 'favorite', :as => 'favorite'
    end
  end
  # map '/' to be a redirect to '/recipes'
  root :to => redirect('/recipes')
end
