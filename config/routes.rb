Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'post_comments/create'
  get 'post_comments/destroy'
  get 'posts/index'
  get 'posts/show'
  get 'posts/edit'
  get 'posts/new'
  get 'users/show'
  get 'users/edit'
  get 'posts/index'
  devise_for :users, controllers:{
  	sessions: "devise/sessions",
  	registrations: "devise/registrations"
  }
  root to: "homes#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/home/about" => "homes#about"
  post "/home/guest_sign_in" => "homes#new_guest"
  get "/home/index" => "homes#index"
end
