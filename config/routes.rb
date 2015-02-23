Weblog::Application.routes.draw do
  resources :users
  resources :blogs do
    resources :posts
  end

  root 'welcome#index'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
