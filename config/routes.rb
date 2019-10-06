Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => "users/registrations",
    :sessions => "users/sessions"
  }

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end
  
  root 'users#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :index, :edit, :update]  do
    resource :posts, only: [:create]
  end
  resources :posts, only: [:create, :edit, :update, :destroy, :index] do
    resource :favorites, only: [:create, :destroy]
  end
end
