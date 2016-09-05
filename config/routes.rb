Rails.application.routes.draw do
  get 'pages/home'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
## for facebok logout
  # devise_scope :user do
  #     delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  #     end

  resources :users do
    resources :friends, only: [:index, :show]
  end

  root :to => "pages#home"


  resources :friendships,       only: [:create, :update, :destroy]
end
