Rails.application.routes.draw do
  resources :navbars
  devise_for :users
  ## 后台权限管理
  # 账号管理
  resources :users, path: :managers do
    member do
      put 'favorite'
      put 'unfavorite'
    end
  end

  namespace :admin do
    resources :sites do      
      resources :navbar
    end
  end
  root "welcome#index"
end
