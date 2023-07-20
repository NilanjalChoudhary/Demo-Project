Rails.application.routes.draw do
  # get 'comments/index'
  # get 'comments/create'
  # get 'comments/destroy'

  root "homes#index"
  get "/homes", to: "homes#index"
  # devise_for :users, :controllers => {registrations: 'registrations'}, :paths => 'users'
  devise_for :users, :controllers => {registrations: 'registrations'}, path: 'users'
    
  devise_scope :user do
    resources :users do
      resources :posts do
        resources :comments
      end
    end
  end

  
  # resources :users do 
    # resources :posts
  # end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
