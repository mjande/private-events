Rails.application.routes.draw do
  resources :events do
    resources :invites, only: [:create, :destroy]
  end

  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end
    
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :users, only: :show

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "events#index"
end
