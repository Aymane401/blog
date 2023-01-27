Rails.application.routes.draw do
devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root "articles#index"

  resources :articles do
    resources :comments
  end

  namespace :api, defaults: { format: 'json' } do
    resources :articles, :comments
  end
  
end