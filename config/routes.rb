Rails.application.routes.draw do
  # get 'booking/index'
  #
  # get 'booking/show'
  #
  # get 'booking/new'
  #
  # get 'booking/edit'
  #
  # get 'booking/delete'

  # get 'customer/index'
  #
  # get 'customer/new'
  #
  # get 'customer/show'
  #
  # get 'customer/edit'
  #
  # get 'customer/delete'

  # get 'admin/index'
  #
  # get 'admin/show'
  #
  # get 'admin/new'
  #
  # get 'admin/edit'
  #
  # get 'admin/delete'

  get "admin", :to => "admin#index"

  match ':controller(/:action(/:id))', :via => [:get, :post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
