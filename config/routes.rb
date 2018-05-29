Rails.application.routes.draw do
  devise_for :users, controllers: { 
    sessions: "users/sessions" }

  root "welcome#index"

  get "welcome/index"

  resources :recipes do
    resources :ingredients
    resources :instructions
    resources :comments
  end

end