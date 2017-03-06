Rails.application.routes.draw do
  resources :styles
  resources :memberships
  resources :memberships do
    post 'toggle_confirmed', on: :member
  end
  resources :beer_clubs
  resources :users
  resources :users do
    post 'freeze', on: :member
  end
  resources :beers
  resources :breweries
  resources :breweries do
    post 'toggle_activity', on: :member
  end
  resources :ratings, only: [:index, :new, :create, :destroy]
  resource :session, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new'
  get 'signin', to: 'sessions#new'
  delete 'signout', to: 'sessions#destroy'  
  root 'breweries#index'
  resources :places, only:[:index, :show]
  post 'places', to:'places#search'
  get 'beerlist', to:'beers#list'
  get 'brewerylist', to: 'breweries#list'
end