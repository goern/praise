Praise2::Application.routes.draw do
  get 'canvas' => 'canvas#index'
  get 'canvas/new' => 'canvas#new_lob'
  root :to => "home#index"

  get 'contact_forms/new'
  post 'contact_forms' => 'contact_forms#create'
  get 'contact_forms' => 'contact_forms#new'
  get 'admin' => "admin#index"
  get 'admin/users' => "users#index"

  resources :users #, :only => [:index, :show, :edit, :update ]
  resources :lobs

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
