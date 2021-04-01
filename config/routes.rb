Rails.application.routes.draw do
  # For details on the DSL available within this file,see https://guides.rubyonrails.org/routing.html

  root to: 'tests#index'

  resources :tests

  resources :users

  #get '/tests/:category/:title', to: 'tests#search', level: 2
  #resources :account, controller: :account
  #resources :tests, only: %i[index show]

  #resources :tests do
  #  resources :questions
  #end

  #resources :tests do
  #  resources :questions, shallow: true
  #end

  #resources :tests do
  #  get :beginner, on: :collection
  #
  #  member do
  #    post :start
  #  end
  #end

  #get '/tests', to: 'tests#index'
  #get '/tests/new', to: 'tests#new'
  #get '/tests/:id', to: 'tests#show', as: :test
  #get '/tests(/:id)', to: 'tests#show'
  #get '/tests/:id/start', to: 'tests#start'
  #get '/tests/:id/start', to: 'tasks#start'
  #match '/tests/:id', to: 'tests#create', via: %i[post put]
  #match '/tests/:id', to: 'tests#create', via: :all

end
