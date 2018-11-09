Rails.application.routes.draw do
  get 'wallet', to: "wallet#index"

  get 'eggs/:id', to: "eggs#index"
  get 'eggs_marketplace', to: "eggs#marketplace_interaction"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
