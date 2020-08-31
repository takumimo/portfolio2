Rails.application.routes.draw do
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
