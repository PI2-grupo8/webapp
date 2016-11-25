Rails.application.routes.draw do
  get 'measurements/index'

  get 'measurements/import'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'public#index'
  match 'settings(/:action)', controller: 'settings', via: :all

end
