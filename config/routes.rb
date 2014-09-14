Rails.application.routes.draw do
  devise_for :users
  root to: 'dashboard#index'

  resources :users
  resources :users_articles
  
  resources :articles, only: [:index, :show], controller: 'dashboard' do
    resources :comments
  end
end
