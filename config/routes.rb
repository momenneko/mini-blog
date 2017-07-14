Rails.application.routes.draw do

  root :to => 'posts#index'

  resources :posts do
    resources :comments
    resources :likes
  end

end
