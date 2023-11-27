# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: redirect('home')
  get 'home', to: 'home#index', as: 'home'
  get 'explore', to: 'explore#index', as: 'explore'
  post 'home', to: 'home#create'
  get 'home/new', to: 'home#new', as: 'new_post'
  get 'home/:id', to: 'home#show', as: 'post_show'
end
