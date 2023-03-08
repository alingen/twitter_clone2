Rails.application.routes.draw do
  devise_for :users
  root to: 'home#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: %i[show update] do
    member do
      patch :withdrawal
    end
  end
  resources :tweets do
    resources :comments, only: [:new, :create] 
  end
end
