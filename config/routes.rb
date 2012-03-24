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

  match '/galleries/:id/paintings/:id' => "paintings#show"
  match '/galleries' => "galleries#index"
  match ':id/galleries' => "galleries#show_other_user"


  match '/user/:id' => "pages#all_about_us"
  match '/video', :to => 'pages#video'
  match '/fun', :to => 'pages#fun'
  match '/asteroids', :to => 'fun#asteroids'
  match '/pacman', :to => 'fun#pacman'
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
  match '/data', :to => 'chart#our_data'
  match '/other_data/:id', :to => 'chart#other_user_data'

  root :to => 'pages#home'

end

