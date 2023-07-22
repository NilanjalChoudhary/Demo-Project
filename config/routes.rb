Rails.application.routes.draw do


  root "homes#index"
  get "/homes", to: "homes#index"

  post "posts/:id/like", to: "posts#like", as: "like"
  post "posts/:id/unlike", to: "posts#unlike", as: "unlike"
  
  # devise_for :users, :controllers => {registrations: 'registrations'}, :paths => 'users'
  
  devise_for :users, :controllers => {registrations: 'registrations'}, path: 'users'
    
  devise_scope :user do
    resources :users do
      resources :profiles
      resources :posts do
        # member do
        #   put "like", to: "posts#like" 
        #   put "unlike", to: "posts#unlike"
        # end
        resources :comments
      end
    end
  end


end
