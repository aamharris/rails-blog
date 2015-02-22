Blog::Application.routes.draw do
  resources :users
  resources :blogs do
    resources :posts
  end
end
