BetaBanshee::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users

  resources :chart
  resources :user_infos
  resources :microposts
  resources :relationships


  resources :galleries
  resources :paintings

  match '/galleries' => "galleries#index"

  match 'destroy_relationship', :to => 'relationships#destroy'
  match '/wall', :to => 'microposts#show'
  match '/wall/:id', :to => 'microposts#show_other_user'
  match '/contact', :to => 'pages#contact'
  match '/help',    :to => 'pages#help'
  match '/', :to => 'pages#home'
  match '/profile', :to => 'user_infos#show'
  match 'followers', :to => 'pages#follower'
  match 'following', :to => 'pages#following'
  match 'search', :to => 'pages#search'
  match '/data', :to => 'chart#graph_code'

  root :to => 'pages#home'



  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

