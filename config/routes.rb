Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  root to: 'welcome#index'
  post :incoming, to: 'incoming#create'
  
  resources :topics do
    resources :bookmarks, except: [:index, :show, :edit, :update] 
  end
  
  resources :bookmarks do
    resources :likes, only: [:create, :destroy]
  end
end
 