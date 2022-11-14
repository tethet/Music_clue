Rails.application.routes.draw do
  # get 'users/show'
  # get 'users/edit'
  # get 'users/destroy'
  # get 'favorites/index'
  # get 'favorites/create'
  # get 'favorites/destroy'
  get 'comments/create'
  # get 'reviews/new'
  # get 'reviews/create'
  # get 'reviews/show'
  # get 'reviews/edit'
  # get 'reviews/update'
  # get 'reviews/destroy'
  devise_for :users
  root :to => 'homes#top'
  get  'music_clue/agreement'  => 'homes#agreement'
  resources :reviews, only: [:show, :edit, :update, :destroy, :create]
  resources :favorites, only: [:index,:create, :destroy]
  resources :users, only: [:show, :edit, :destroy]
  get 'users/ending'
  
  # get  "tweets/new"  => "tweets#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
