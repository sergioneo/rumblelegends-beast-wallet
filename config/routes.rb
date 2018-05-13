Rails.application.routes.draw do
  get 'eggs/:id', to: "eggs#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
