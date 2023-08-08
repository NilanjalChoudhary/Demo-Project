Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api do
    namespace :v1 do

      get "/homes", to: "homes#index"
      root "homes#index"
      
      get 'messages/new'
      get 'messages/index'
      get 'rooms/index'
      get 'chats/show'
      
      get "/profile/:profile_id/chat", to: "profiles#private_chat", as: "private_chat"

      get "profile/:id/show_followers", to: "profiles#show_followers", as: "show_followers"
      
      get "profile/:id/show_followings", to: "profiles#show_followings", as: "show_followings"

      get "posts/search/:username", to: "profiles#search", as: "search_user"

      get "posts/approv_accounts", to: "profiles#approv_accounts", as: "approve"

      put "approve_path/confirm_approve/:user_id", to: "profiles#confirm_approve", as: "confirm_approve"

      post "posts/:id/like", to: "posts#like", as: "like"

      post "posts/:id/unlike", to: "posts#unlike", as: "unlike"

      # devise_for :users, :controllers => {registrations: 'registrations'}, :paths => 'users'

      resources :rooms do
        resources :messages
      end

      devise_for :users, :controllers => {registrations: 'registrations'}, path: 'users'
      
      devise_scope :user do
        # get 'users/:id', to: 'registrations#show', as: 'user'

        post 'user/:id/follow', to: "registrations#follow", as: "follow"
        post 'user/:id/unfollow', to: "registrations#unfollow", as: "unfollow"
        post 'user/:id/accept', to: "registrations#accept", as: "accept"
        post 'user/:id/cancel', to: "registrations#cancel", as: "cancel"
        resources :users do
          resources :contacts, only: [:new, :create]
          resources :profiles
          resources :posts do
            resources :comments
          end 
        end 
      end
    end
  end 
  
  # devise_for :users, controllers: { sessions: 'users/sessions' }
  
  get "/homes", to: "homes#index"
  root "homes#index"
  
  get 'messages/new'
  get 'messages/index'
  get 'rooms/index'
  
  get 'chats/show'
  
  get "/profile/:profile_id/chat", to: "profiles#private_chat", as: "private_chat"
  
  get "profile/:id/show_followers", to: "profiles#show_followers", as: "show_followers"
  get "profile/:id/show_followings", to: "profiles#show_followings", as: "show_followings"

  get "posts/search/:username", to: "profiles#search", as: "search_user"

  get "posts/approv_accounts", to: "profiles#approv_accounts", as: "approve"

  put "approve_path/confirm_approve/:user_id", to: "profiles#confirm_approve", as: "confirm_approve"

  post "posts/:id/like", to: "posts#like", as: "like"
  post "posts/:id/unlike", to: "posts#unlike", as: "unlike"

  resources :rooms do
    resources :messages
  end

  # devise_for :users, :controllers => {registrations: 'registrations'}, path: 'users'

  # devise_for :users, controllers: { sessions: 'users/sessions' }

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup',
    confirmation: 'confirm'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmation: 'user/confirmations'
  }

  devise_scope :user do
    # get 'users/:id', to: 'registrations#show', as: 'user'

    post 'user/:id/follow', to: "registrations#follow", as: "follow"
    post 'user/:id/unfollow', to: "registrations#unfollow", as: "unfollow"
    post 'user/:id/accept', to: "registrations#accept", as: "accept"
    post 'user/:id/cancel', to: "registrations#cancel", as: "cancel"
    resources :users do
      resources :contacts, only: [:new, :create]
      resources :profiles
      resources :posts do
        resources :comments
      end 
    end 
  end
end