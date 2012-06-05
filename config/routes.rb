RehactivePage::Application.routes.draw do

  resources :contacts, only: [:new, :create, :show]
  resources :news, only: [:index, :show]
  resource :sitemap, only: :show

  match 'about' => 'static_pages#about', :as => :about_page
  match 'offer' => 'static_pages#offer', :as => :offer_page
  match 'map' => 'static_pages#map', :as => :map_page
  
  root :to => 'static_pages#home'
end
