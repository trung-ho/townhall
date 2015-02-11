Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", sessions: "users/sessions" }

  get 'pages/home'
  get 'pages/member_home'

  devise_for :admin_users, ActiveAdmin::Devise.config

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  namespace :organizer do
    resources :dashboard
    resources :organizations 
    resources :questions
    resources :votings
    resources :reasons
  end

  resources :organizations, only: [:show] do
    resources :questions, only: [:show]
  end

  resources :questions do
    resources :votes
  end

  ActiveAdmin.routes(self)

  # You can have the root of your site routed with "root"
  authenticated :user do
    root 'organizer/dashboard#index', as: :authenticated_root
  end

  unauthenticated :user do
    root 'pages#home'
  end

  resources :users

  # constraints Subdomain do
  #   scope as: 'organization' do
  #     root 'organizations#show'
  #     resources :questions, only: [:show]
  #   end
  # end


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example, of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
