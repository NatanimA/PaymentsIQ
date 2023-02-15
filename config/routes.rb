Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  devise_scope :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root "categories#index"
  resources :categories do
    resources :transfers
  end

  resources :users

end
