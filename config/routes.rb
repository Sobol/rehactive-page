RehactivePage::Application.routes.draw do

  match 'about' => 'static_pages#about', :as => :about_page
  match 'offer' => 'static_pages#offer', :as => :offer_page
  match 'visits' => 'static_pages#visits', :as => :visits_page
  match 'contact' => 'static_pages#contact', :as => :contact_page
  root :to => 'static_pages#home'
end
