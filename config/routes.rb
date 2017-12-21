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
# 后台网站板式组成部分的路径
  namespace :admin do
    resources :advantage_pics do
      member do
        delete 'delete'
      end
    end
    resources :cooperation_pics do
      member do
        delete 'delete'
      end
    end
    resources :contents_classes
    resources :sites
<<<<<<< HEAD
    resources :articles
=======
    resources :emails
>>>>>>> 17f547689cf580377f48636b3fcc30c0817b3885
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
<<<<<<< HEAD
  resources :articles do
    resources :comments
  end
=======
  resources :emails
>>>>>>> 17f547689cf580377f48636b3fcc30c0817b3885
  resources :contents
  resources :footers
  resources :contents_classes
  resources :navbars
  resources :cooperation_pics
  resources :advantage_pics

  root "welcome#index"
end
