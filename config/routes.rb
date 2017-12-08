Rails.application.routes.draw do
  # get 'admin/index'
  #
  # get 'admin/show'
  #
  # get 'admin/new'
  #
  # get 'admin/edit'
  #
  # get 'admin/delete'

  match ':controller(/:action(/:id))', :via => [:get, :post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
