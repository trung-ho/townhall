Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations' }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  get '404', to: 'application#page_not_found'

  constraints RootSubdomain do
    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)

    # You can have the root of your site routed with "root"
    authenticated :user do
      root 'organizer/dashboard#index', as: :authenticated_root
    end

    unauthenticated :user do
      root 'organizer/registrations#new'
    end

    resources :users

    namespace :organizer do
      resources :dashboard
      resources :organizations
      resources :pages do
        get 'home'
        get 'member_home'
      end
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

    namespace :setting do
      resource :user, only: [:show, :edit, :update]
      resources :notifications, only: [:index] do 
        collection do 
          get :follow
        end
      end
      resources :posts, only: [] do 
        collection do 
          get :privacy
          get :faq
        end
      end
    end

    resources :settings, only: [] do
      collection do
        get :terms, :my_townhall, :privacy, :submission_policy
      end
    end

    resources :followers, only: [] do 
      member do 
        get :toggle_notifications
        get :toggle_email
      end
    end

    resources :feedbacks, only: [:new, :create]
    resources :reasons, only: [:create]
    resources :votes
    resources :users

    namespace :organizer do
      resources :dashboard
      resources :organizations
      
      resources :questions do
        member do 
          get :report
        end
      end

      resources :votings
      resources :rankings
      resources :ideas
      resources :reasons
    end
  end
end
