Rails.application.routes.draw do

  resources :answers
  root 'tests#index'

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true
    end
  end
end
