Rottenpotatoes::Application.routes.draw do
  resources :recipes do
    collection do
      post :search, :action => 'search_index', :as => 'search_index'
      get 'search/:q', :action => 'search', :as => 'search'
    end
  end
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/recipes')
end
