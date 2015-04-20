Rails.application.routes.draw do
  devise_for :users, controllers: {
                        omniauth_callbacks: "users/omniauth_callbacks",
                        sessions: "users/sessions",
                        registrations: 'users/registrations' }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  constraints RootSubdomain do
    get 'pages/home'
    get 'pages/member_home'

    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)

    # You can have the root of your site routed with "root"
    authenticated :user do
      root 'organizer/dashboard#index', as: :authenticated_root
    end

    unauthenticated :user do
      root 'pages#home'
    end

    resources :users

    namespace :organizer do
      resources :dashboard
      resources :organizations
    end
  
  end

  constraints Subdomain do
    scope as: 'organization' do
      root 'organizations#show'
      resources :questions, only: [:show] do
        get :reasons
        get :result
        resources :votes
      end
    end

    resources :settings, only: [] do
      collection do
        get :settings, :terms, :notifications, :my_townhall, :privacy, :submission_policy
      end
    end
    resources :feedbacks, only: [:new, :create]
    resources :reasons, only: [:create]
    resources :votes

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
