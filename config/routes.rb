Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  
  # devise_scope :user do
  #   get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
  
  root "posts#index"

  resources :posts do
    collection do
      get :search
    end
  end

  resources :photos,:stories do
    resources :comments
  end

  resources :recipes do
    resources :notes
    resources :comments
    post "recipes/:id/toggle", to: "recipes#toggle", as: :toggle
  end


  get "/acknowledgments", to: "home#acknowledgments"
  get "/contact", to: "home#contact"
  get "/contributors", to: "home#contributors"
  get "/copyright", to: "home#copyright"
  get "/dedication", to: "home#dedication"
  get "/privacy-policy", to: "home#privacy-policy"
  get "tags/:tag", to: "recipes#index", as: "tag"
  get "/terms-of-service", to: "home#terms-of-service"

end
