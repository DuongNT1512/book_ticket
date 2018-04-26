Rails.application.routes.draw do
  root to: redirect("/en")

  scope ":locale" do
    root to: "home_pages#index"

    get "contact", to: "home_pages#contact"
    get "help", to: "home_pages#help"
    get "about", to: "home_pages#about"

    devise_for :users, skip: %i(sessions registrations), controllers: {
      confirmations: "users/confirmations"
    }
    devise_scope :user do
      post "users/sign_in", to: "users/sessions#create", as: :user_session
      delete "users/sign_out", to: "users/sessions#destroy", as: :destroy_user_session

      get "users/edit", to: "users/registrations#edit", as: :edit_user_registration
      post "users", to: "users/registrations#create", as: :user_registration
      patch "users", to: "users/registrations#update", as: nil
      delete "users", to: "users/registrations#destroy", as: nil
    end

    resources :shows, only: :index
    resources :theaters, only: :index
    resources :orders, only: %i(new create show destroy) do
      resources :payments, only: :create
    end
    resources :movies, only: %i(index show)
  end
end
