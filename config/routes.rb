Rails.application.routes.draw do
 devise_for :users
 root to: 'homes#top'
 get 'home/about' => 'homes#about', as: "about"
 get 'books' => 'books#index', as: "books"
 resources :users
 resources :books
 patch 'books/:id' => 'books#update', as: 'update_book'
 patch 'users/:id' => 'users#update', as: 'update_user'
 delete 'books/:id' => 'books#destroy', as: 'destroy_book'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
