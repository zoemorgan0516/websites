Rails.application.routes.draw do
  devise_for :users
  ## 后台权限管理
  # 账号管理
  resources :users, path: :managers do
    member do
      put 'favorite'
      put 'unfavorite'
    end
  end

  # 站点路径
  resources :sites do
    resources :navbar
  end
  # 命名空间下的resources
  namespace :admin do
    resources :sites do
      resources :navbar
    end
  end

  root "welcome#index"
end
