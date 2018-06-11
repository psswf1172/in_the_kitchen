Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  root "posts#index"


  get "/acknowledgments", to: "home#acknowledgments"
  get "/contact", to: "home#contact"
  get "/contributors", to: "home#contributors"
  get "/copyright", to: "home#copyright"
  get "/dedication", to: "home#dedication"
  get "/original-dedication", to: "home#original-dedication"
  get "/privacy-policy", to: "home#privacy-policy"
  get "/terms-of-service", to: "home#terms-of-service"

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
