Rails.application.routes.draw do
  devise_for :users, controllers: { 
    sessions: "users/sessions" }

  root "welcome#index"

  get "welcome/index"

  resources :recipes do
    resources :comments
    resources :ingredients
    resources :instructions
  end

end