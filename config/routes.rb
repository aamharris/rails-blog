Blog::Application.routes.draw do
 resources :users do
    resources :blogs do
      resources :posts
    end
  end
end
