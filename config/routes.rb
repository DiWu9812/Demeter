Rottenpotatoes::Application.routes.draw do

  resources :users, only: [:new, :create]
  get 'signup', to: 'users#new'
  get 'login', to: 'login_session#new'
  post 'login', to: 'login_session#create'
  get 'logout', to: 'login_session#destroy'

  resources :recipes do
    collection do
      post :search, :action => 'search_index', :as => 'search_index'
      get 'search/:q', :action => 'search', :as => 'search'
      get 'page/:id', :action => 'page', :as => 'page'
      post :favorite, :action => 'favorite', :as => 'favorite'
      get :favorited, :action => 'favorited', :as => 'favorited'
      get 'create', :action => 'create', :as => 'create'
      get 'created', :action => 'created', :as => 'created'
      post :upvote, :action => 'upvote', :as => 'upvote'
      post :downvote, :action => 'downvote', :as => 'downvote'
    end
  end
  # map '/' to be a redirect to '/recipes'
  root :to => redirect('/recipes')
end
