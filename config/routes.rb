Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      confirmations: 'users/confirmations'
  }
  resources :companies
  resources :orders
  resources :tasks do
    member do
      get 'get_price'
    end
  end

  root 'companies#homepage'
  get "companies/homepage", to: "companies#homepage", as: "companies_homepage"
  devise_scope :user do
    match "users/create_new_user" => "users/registrations#create_new_user", :controllers =>{:registrations => "users/registrations"}, :as => "create_new_account_user_registration",:via => :post
    match "users/new_user" => "users/registrations#new_user", :controllers =>{:registrations => "users/registrations"},:as => "new_account_user_registration", :via => :get
    match "users/:id" => "users/registrations#show", :controllers =>{:registrations => "users/registrations"},:as => "view_user_details", :via => :get
    get '/signout', to: 'devise/sessions#destroy', as: :signout
    match "users/registration/index" => "users/registrations#index", :controllers =>{:registrations => "users/registrations"},:as => "index_users", :via => :get
  end
  resources :locations
  #get "/create_new_user/:id", to: "companies#create_new_user", as: "create_new_user"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
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
