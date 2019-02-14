Rails.application.routes.draw do
  
  resources :collections do
    resources :comments, module: :collections
  end

  resources :categories

  resources :events

  resources :users do
    member do
      post :follow
    end
  end

  resources :books do
    resources :reviews
    resources :comments, module: :books
    resource :likes, module: :books

    member do
      post :bookmark
    end
  end
  
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end

  devise_for :users, path: 'u', :controllers => {:registrations => "registrations"}  

  root to: 'pages#home'
end
