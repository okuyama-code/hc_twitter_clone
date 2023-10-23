# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/top'
  root 'home#top'
  get '/profile' => 'home#profile'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  # TODO githubでログインできない
  # devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    get "user/:id", :to => "users/registrations#detail"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
    # root "users/sessions#new"
    # root "users/registrations#new"
  end
end
