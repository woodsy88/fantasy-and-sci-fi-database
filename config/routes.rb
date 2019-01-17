Rails.application.routes.draw do
  
  resources :series
  resources :books
  
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end

  devise_for :users, :controllers => {:registrations => "registrations"}  

  root to: 'pages#home'
end
