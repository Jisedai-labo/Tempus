Rails.application.routes.draw do
  root 'users#home'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :posts, only: [:new, :create, :edit, :update, :destroy, :show, :index] do
    resource :favorites, only: [:create, :destroy]
  end
end
