Rails.application.routes.draw do

  root "homes#index"
  get "/homes", to: "homes#index"

  get "profile/:id/show_followers", to: "profiles#show_followers", as: "show_followers"
  get "profile/:id/show_followings", to: "profiles#show_followings", as: "show_followings"

  # post "posts/:id/like", to: "posts#like", as: "like"
  # post "posts/:id/unlike", to: "posts#unlike", as: "unlike"

  # devise_for :users, :controllers => {registrations: 'registrations'}, :paths => 'users'

  devise_for :users, :controllers => {registrations: 'registrations'}, path: 'users'
    
  devise_scope :user do
    post 'user/:id/follow', to: "registrations#follow", as: "follow"
    post 'user/:id/unfollow', to: "registrations#unfollow", as: "unfollow"
    post 'user/:id/accept', to: "registrations#accept", as: "accept"
    post 'user/:id/cancel', to: "registrations#cancel", as: "cancel"
    resources :users do
      resources :profiles
      resources :posts do
        post "posts/:id/like", to: "posts#like", as: "like"
        post "posts/:id/unlike", to: "posts#unlike", as: "unlike"
        # member do
        #   put "like", to: "posts#like" 
        #   put "unlike", to: "posts#unlike"
        # end
        resources :comments
      end 
    end 
  end 
end 