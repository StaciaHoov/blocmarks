Rails.application.routes.draw do

  devise_for :users
  get 'welcome/about'
  root to: 'topics#index'
  post :incoming, to: 'incoming#create'
  
  resources :topics do
    resources :bookmarks, except: [:index]
  end

end
