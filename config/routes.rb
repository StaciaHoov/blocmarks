Rails.application.routes.draw do

  devise_for :users
  get 'welcome/about'
  root to: 'welcome#index'
  post :incoming, to: 'incoming#create'
  
  resources :topics do
    resources :bookmarks
  end

end
