RehactivePage::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users

  resources :contacts, only: [:new, :create, :show]
  resources :news, only: [:index, :show]
  resource :sitemap, only: :show

  get 'about' => 'static_pages#about', :as => :about_page
  get 'offer' => 'static_pages#offer', :as => :offer_page
  get 'map' => 'static_pages#map', :as => :map_page

  root :to => 'static_pages#home'
  namespace :admin do
    resources :news

    root to: "news#index"
  end
end
