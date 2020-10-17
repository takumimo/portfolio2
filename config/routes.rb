Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  devise_for :users, controllers:{
  	sessions: "devise/sessions",
  	registrations: "devise/registrations"
  }

  
  post 'posts/confirm' => 'posts#confirm'
  resources :posts, only:[:index, :new, :create, :edit, :update, :show, :destroy] do
    resource :post_comments, only:[:create, :destroy]
  end
  

  resources :users, only:[:show, :edit, :update]

  root to: "homes#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "/home/guest_sign_in" => "homes#new_guest"
end
