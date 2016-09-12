Rails.application.routes.draw do
  # get 'posts/new'
  #
  # get 'posts/edit'

  get 'pages/home'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
## for facebok logout
  # devise_scope :user do
  #     delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  #     end

  resources :friendships,       only: [:create, :update, :destroy]

  resources :users do
    resources :friends, only: [:index, :show]
  end
  resources :posts do
    resources :likes, only: [:create, :destroy]

  end
  
  resources :comments, only: [:create, :update, :destroy, :index]

  root :to => "pages#home"



end
