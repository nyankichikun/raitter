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
      resources :tweets
      resources :follow_relationships, only: [:create, :destroy]
      resources :favorites, only: [:create, :destroy]
    end
  end
end
