Rails.application.routes.draw do

  scope :admin do
    resources :categories
    resources :posts
  end

  get 'public/category/:category_slug', to: "public#search", :as => :category_search

  root 'public#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
