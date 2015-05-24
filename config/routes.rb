Rails.application.routes.draw do

  constraints RootSubdomain do
    devise_for :admin_users
    #, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
    namespace :organizer do
      resources :dashboard, only: [:index]
      resources :organizations
      resources :pages do
        get 'home'
        get 'member_home'
      end
    end
    
    
    root to: 'organizer/dashboard#index'
    
    match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  end

  constraints Subdomain do
    devise_for :users
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
  
  get '404', to: 'application#page_not_found'
end
