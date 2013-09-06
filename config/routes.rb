Myapp::Application.routes.draw do
  get "admin/index"
  
  resources :lobs

  root :to => "home#index"
  
  get '/admin' => "admin#index"
  get '/admin/users' => "users#index"

  resources :users #, :only => [:index, :show, :edit, :update ]

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
