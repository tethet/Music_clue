Rails.application.routes.draw do
  # get 'users/show'
  # get 'users/edit'
  # get 'users/destroy'
  # get 'favorites/index'
  # get 'favorites/create'
  # get 'favorites/destroy'
  # get 'comments/create'
  # get 'reviews/new'
  # get 'reviews/create'
  # get 'reviews/show'
  # get 'reviews/edit'
  # get 'reviews/update'
  # get 'reviews/destroy'
  devise_for :users
  get 'homes/top' => 'homes#top', as: 'top' 
  get  'music_clue/agreement'  => 'homes#agreement'
  resources :reviews, only: [:new, :show, :edit, :update, :destroy, :create] do
   resources :favorites, only: [:create, :destroy]
   post 'comment' => 'comments#create'
  end
  resources :users, only: [:show, :edit, :destroy, :update] do
  member do
    get :favorite
    get :ending
  end
  end
  get "search" => "searches#search"
 
  
  
  # get  "tweets/new"  => "tweets#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
