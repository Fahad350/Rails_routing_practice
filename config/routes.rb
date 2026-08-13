Rails.application.routes.draw do

   #resources :users
   #resources :posts, only: [:new, :index]


   #member route test
   resources :posts do 
    member do 
      post :publish
    end
  end


   resources :comments, except: [:show]


    #custom route
    get "/application", to: "application#hello"


    #member/collection route
    resources :users do
        member do
          patch :activate
          patch :deactivate
          delete :archive
      end
      collection do
        get :active
      end
   end

   #nested routes

   resources :users do
      resources :posts
    end
   
  
    

   #namespace
  namespace :admin do
    get "posts/index"
    get "posts/show"
    get "users/index"
    get "users/show"
  end
  get "comments/index"
  get "comments/show"
  get "comments/new"
  get "comments/edit"
  get "posts/index"
  get "posts/show"
  get "posts/new"
  get "posts/edit"
  get "users/index"
  get "users/show"
  get "users/new"
  get "users/edit"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "posts#index"
end
