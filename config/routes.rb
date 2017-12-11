Rails.application.routes.draw do
  namespace :admin do
    resources :footers
  end
  namespace :admin do
    resources :classes
  end
  namespace :admin do
    resources :navbars
  end
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
    resources :sites
    resources :url_addresses
  end
  root "welcome#index"
end
