Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'festivals#home'
  get 'users/:id' => 'festivals#profile', as: 'profile'
  resources :festivals
  post 'festivals/:id' => 'festivals#favorite', as: 'favorite'
  get 'users/:id/fav' => 'festivals#saved', as: 'saved'
end
