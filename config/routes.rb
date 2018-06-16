Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  root "posts#index"

  resources :posts do
    # collection do
    #   get :search
    # end
  end

  resources :photos, :recipes, :stories do
    resources :comments
  end

  get "/acknowledgments", to: "home#acknowledgments"
  get "/contact", to: "home#contact"
  get "/contributors", to: "home#contributors"
  get "/copyright", to: "home#copyright"
  get "/dedication", to: "home#dedication"
  get "/privacy-policy", to: "home#privacy-policy"
  get "tags/:tag", to: "recipes#index", as: "tag"
  get "/terms-of-service", to: "home#terms-of-service"

  post '/upload_image' => 'upload#upload_image', :as => :upload_image
  get "/download_file/:name" => "upload#access_file", :as => :upload_access_file, :name => /.*/

end