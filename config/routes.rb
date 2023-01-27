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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end