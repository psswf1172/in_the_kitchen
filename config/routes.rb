Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  root "posts#index"

  get "welcome/index"

  resources :posts

  resources :photos

  resources :recipes do
    resources :comments
    resources :ingredients
    resources :instructions
  end

  resources :stories

  get "tags/:tag", to: "recipes#index", as: "tag"

end
