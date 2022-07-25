Rails.application.routes.draw do
  resources :events
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "events#index"
end
