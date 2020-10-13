Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  devise_for :users, controllers:{
  	sessions: "devise/sessions",
  	registrations: "devise/registrations"
  }

  get 'post_comments/create'
  get 'post_comments/destroy'
  
  resources :posts, only:[:index, :new, :create, :edit, :update, :show, :destroy]
  post 'posts/confirm' => 'posts#confirm'

  get 'users/show'
  get 'users/edit'

  root to: "homes#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/home/about" => "homes#about"
  post "/home/guest_sign_in" => "homes#new_guest"
  get "/home/index" => "homes#index"
end
