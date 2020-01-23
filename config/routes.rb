Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :users do
        member do
          get :following, :followers
        end
      end
      resources :tweets,               only: [:index, :create]
      resources :follow_relationships, only: [:create, :destroy]
      resources :favorites,            only: [:create, :destroy]
      resources :rooms,                only: [:index, :create, :destroy]
      resources :entries,              only: [:index, :create, :destroy]
      resources :messages,             only: [:index, :create]
    end
  end
end
