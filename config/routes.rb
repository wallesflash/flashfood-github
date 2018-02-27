Rails.application.routes.draw do

  get '/client_panel' => "client_panel#my_booking", :as => :customer_root
  get '/booking' => "booking#index", :as => :admin_root

  devise_for :admins, :class_name => 'Admin', :controllers => {:registrations => "admin/registrations", :sessions => 'admin/sessions' }

  devise_for :customers, :class_name => 'Customer', :controllers => {:registrations => "customer/registrations", :sessions => 'customer/sessions' }



  match ':controller(/:action(/:id))', :via => [:get, :post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
