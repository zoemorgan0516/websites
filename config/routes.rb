Rails.application.routes.draw do
  devise_for :users
  # 后台权限管理
  namespace :admin do
    resources :sites do      
      resources :navbar
    end
  end
  root "welcome#index"
end
