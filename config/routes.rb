Rottenpotatoes::Application.routes.draw do
  get '/' =>"movies#index"
  resources :movies do
    resources :similar, :controller=> 'movies', :action => 'similar', :only => [:index]
  end
  root :to => redirect('/movies')
  get 'movies/:id/similar' => 'movies#similar', :as => :similar
end
