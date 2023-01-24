Rails.application.routes.draw do
  get 'comments/:id/new' => 'comments#new', as: 'comment_new'
  post 'comments/:id/create' => 'comments#create', as: 'comment_create'

  devise_for :users
  root to: 'home#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: %i[show] do
    member do
      patch :withdrawal
    end
  end
  resources :tweets, :comments
end
