Rails.application.routes.draw do

  get 'searches/index'
  root "homes#top"
  get "homes/about" => "homes#about"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  devise_for :users, controllers:{
  	sessions: "devise/sessions",
  	registrations: "devise/registrations"
  }

  
  post 'posts/confirm' => 'posts#confirm'
  resources :posts, only:[:index, :new, :create, :edit, :update, :show, :destroy] do
    resource :likes, only:[:create, :destroy]
    resource :post_comments, only:[:create]

  end
  delete "posts/:post_id/post_comments/:post_comment_id", to: "post_comments#destroy", as: :post_comment

  resource :tags, only:[:create, :destroy]
  resources :users, only:[:show, :edit, :update]

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "/home/guest_sign_in" => "homes#new_guest"
end
