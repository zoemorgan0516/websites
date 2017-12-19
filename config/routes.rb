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
# 后台网站板式组成部分的路径
  namespace :admin do
    resources :sites
    resources :articles
    resources :url_addresses
    resources :footers
    resources :categories
    resources :contents
    resources :cooperations
    resources :photos do
      member do
        delete 'delete'
      end
    end
    resources :slider_pictures
    resources :advantages
  end
# 前台网站展示路径
  resources :sites
  resources :articles
  resources :contents
  resources :footers

  root "welcome#index"
end
