Rails.application.routes.draw do

##后台登录
  devise_for :users

## 后台权限管理
# 账号管理
  resources :users, path: :managers

# 后台网站板式组成部分的路径
  namespace :admin do
    resources :sites
    resources :categories
    resources :contents_classes
    resources :contents
    resources :slider_pictures
    resources :advantages
    resources :cooperations
    resources :articles
    resources :emails
    resources :photos do
      member do
        delete 'delete'
      end
    end
  end

# 前台网站展示路径
  resources :sites
  resources :articles
  resources :emails
  resources :contents

# 登录后展示的页面
  root "sites#show"

end
