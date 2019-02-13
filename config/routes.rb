Rails.application.routes.draw do
  
  resources :collections do
    resources :comments, module: :collections
  end

  resources :categories

  resources :books do
    resources :reviews
    resources :comments, module: :books
    resource :likes, module: :books
  end
  
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end

  devise_for :users, :controllers => {:registrations => "registrations"}  

  root to: 'pages#home'
end
