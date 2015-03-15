Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", sessions: "users/sessions" }

  constraints RootSubdomain do
    get 'pages/home'
    get 'pages/member_home'

    devise_for :admin_users, ActiveAdmin::Devise.config

    match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

    ActiveAdmin.routes(self)

    # You can have the root of your site routed with "root"
    authenticated :user do
      root 'organizer/dashboard#index', as: :authenticated_root
    end

    unauthenticated :user do
      root 'pages#home'
    end

    resources :users
  end

  constraints Subdomain do
    scope as: 'organization' do
      root 'organizations#show'
      resources :questions, only: [:show] do
        get :result
        resources :votes
      end
    end

    namespace :organizer do
      resources :dashboard
      resources :organizations 
      resources :questions
      resources :votings
      resources :rankings
      resources :ideas
      resources :reasons
    end
  end
end
