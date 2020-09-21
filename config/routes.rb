Rails.application.routes.draw do
  devise_for :users,
  controllers: { registrations: 'registrations',omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'posts#index'
  get '/users/:id', to: 'users#show', as: 'user'
  resources :posts   , only: %i(index new create show destroy) do
  resources :photos  , only: %i(create)
  resources :likes   , only: %i(create destroy)
  resources :comments, only: %i(create destroy)
  end
  
  devise_scope :user do
    get '/users/auth/:provider/upgrade' => 'users/omniauth_callbacks#upgrade', as: :user_omniauth_upgrade
    get '/users/auth/:provider/setup', :to => 'users/omniauth_callbacks#setup'
  end
  
  put 'users/follow/:user_id' => 'users#follow'
  put 'users/unfollow/:user_id' => 'users#unfollow'
  #フォローとフォローを外すアクション
  
  get 'users/follow_list/:user_id' => 'users#follow_list'
  get 'users/follower_list/:user_id' => 'users#follower_list'
  #フォロー・フォロワーの一覧ページ
end