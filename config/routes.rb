RehactivePage::Application.routes.draw do

  match 'about' => 'static_pages#about', :as => :about_page
  match 'offer' => 'static_pages#offer', :as => :offer_page
  match 'map' => 'static_pages#map', :as => :map_page
  match 'contact' => 'static_pages#contact', :as => :contact_page
  root :to => 'static_pages#home'
end
