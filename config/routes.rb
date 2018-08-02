Rails.application.routes.draw do

  get '/logout', to: 'sessions#destroy'
  get 'auth/:provider/callback' => 'users#create'#このpathを通して認証が行われる。

  get 'sessions/create'
  get 'sessions/destroy'
 root 'articles#top'

  devise_for :admins ,only:[:sign_in,:sign_up,:session]
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

  resources :users,only: [:show, :create, :update]

  resources :articles do
    resource :favorites, only: [:create, :destroy]
    resource :article_comments, only: [:create, :destroy]
  end

  resources :tags,only:[:index]
  resources :categories,param: :name,only:[:show]

  namespace :articles do
    resources :genres, param: :genre_list, only: [:index, :show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
