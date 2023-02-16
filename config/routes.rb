Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  devise_scope :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :categories do
    resources :transfers
  end

  resources :users

  root to: "homes#index", as: 'auth_login'

end
