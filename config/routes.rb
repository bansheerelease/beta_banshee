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
  resources :videos

  root :to => 'pages#home'
  match '/', :to => 'pages#home'

  #Galleries
  match '/galleries/:id/paintings/:id' => "paintings#show"
  match '/galleries' => "galleries#index"
  match ':id/galleries' => "galleries#show_other_user"

  #Video
  match 'videos/show/:id' => "videos#show"
  match ':id/videos/all' => "videos#index"
  match '/download/videos', :to => 'videos#load_file'

  #Wall
  match '/wall', :to => 'microposts#show'
  match '/wall/:id', :to => 'microposts#show_other_user'

  #Profile
  match '/profile', :to => 'user_infos#show'

  #Following/Followers
  match 'followers', :to => 'pages#follower'
  match 'following', :to => 'pages#following'

  #Games
  match '/fun', :to => 'pages#fun'
  match '/asteroids', :to => 'fun#asteroids'
  match '/pacman', :to => 'fun#pacman'

  #Wall
  match '/user/:id' => "pages#all_about_us"

  #Contact
  match '/contact', :to => 'pages#contact'

  #Help
  match '/help',    :to => 'pages#help'

  #Destroy relationship
  match 'destroy_relationship', :to => 'relationships#destroy'

  #Search
  match 'search', :to => 'pages#search'

  #Flex chart
  match '/data', :to => 'chart#our_data'
  match '/other_data/:id', :to => 'chart#other_user_data'



end

