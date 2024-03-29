Rails.application.routes.draw do

  root 'tests#index'

  resources :feedbacks, only: %i[new create]

  resources :user_badges, only: :index

  get 'user_badges', to: 'user_badges#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: :index do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
  end

  end

  namespace :admin do
    resources :gists
    resources :badges
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end
  end

end
