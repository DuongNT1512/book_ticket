Rails.application.routes.draw do
  root to: redirect("/en")

  scope ":locale" do
    root to: "home_pages#index"

    get "contact", to: "home_pages#contact"
    get "help", to: "home_pages#help"
    get "about", to: "home_pages#about"
  end
end
