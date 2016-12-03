Rails.application.routes.draw do

  root 'application#index'

  match 'measurements(/:action)', controller: 'measurements', via: :all

  match 'settings(/:action)', controller: 'settings', via: :all

  resources :measurements do
    collection { post :import }
  end

  match 'net(/:action)', controller: 'sockets', via: :all

end
