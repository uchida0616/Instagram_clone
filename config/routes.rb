Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root to: 'users#new'
  resources :favorites, only: [:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users do
    member do
      get :favorite_post
    end
  end
  resources :posts do
     collection do
       post :confirm
    end
  end
end
