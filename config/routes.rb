Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  root "posts#index"

  get "welcome/index"

  resources :posts do
    collection do
      get :search
    end
  end

  resources :photos, :recipes, :stories do
    resources :comments
  end


  get "tags/:tag", to: "recipes#index", as: "tag"

end
