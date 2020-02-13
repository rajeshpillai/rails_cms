Rails.application.routes.draw do

  scope :admin do
    resources :tags
    resources :categories
    resources :posts
  end

  get 'public/category/:category_slug', to: "public#search", :as => :category_search
  get 'public/tags/:tag', to: "public#search", :as => :tag_search

  root 'public#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
