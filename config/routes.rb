Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    namespace :admin do
      get "/home", to: "home#index"
    end
  end
end
