Rails.application.routes.draw do
  root "homes#top"
  get "homes/about" => "homes#about"

  devise_for :users, controllers: {
    sessions: "devise/sessions",
    registrations: "devise/registrations",
  }

  post 'posts/confirm' => 'posts#confirm'
  resources :posts, only: [:index, :new, :create, :edit, :update, :show, :destroy] do
    resource :likes, only: [:create, :destroy]
    resource :post_comments, only: [:create]
  end
  delete "posts/:post_id/post_comments/:post_comment_id", to: "post_comments#destroy", as: :post_comment
  post "posts/:post_id/post_comments/:post_comment_id/thanks", to: "thanks#create", as: :thank
  delete "posts/:post_id/post_comments/:post_comment_id/thanks", to: "thanks#destroy"

  resource :tags, only: [:create, :destroy]
  resources :users, only: [:show, :edit, :update] do
    member do
      get :following, :followers
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "/home/guest_sign_in" => "homes#new_guest"
  resources :relationships, only: [:create, :destroy]
  resources :stocks, only: [:index, :create, :destroy]
end
