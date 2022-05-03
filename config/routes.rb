Rails.application.routes.draw do
  get 'favorites/index'
  root 'sessions#new'
  get 'posts/index'
  resources :posts do
    collection do
      post :confirm
    end
  end

  resources :users, only: [:new, :create, :show, :edit, :update]

  resources :sessions, only: [:new, :create, :destroy]

  resources :favorites, only: [:index, :create, :destroy, :show]

  mount LetterOpenerWeb::Engine, at: "/inbox"
end
