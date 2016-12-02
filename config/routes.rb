Rails.application.routes.draw do

  root 'application#index'

  get 'measurements/index'
  get 'measurements/import'
  get '/measurements/humidity_heatmap' => 'measurements#humidity_heatmap'
  get '/measurements/air_humidity_heatmap' => 'measurements#air_humidity_heatmap'
  get '/measurements/air_temperature_heatmap' => 'measurements#air_temperature_heatmap'


  match 'manual(/:action)', controller: 'manual', via: :all
  resources :measurements do
    collection { post :import }
  end

  match 'settings(/:action)', controller: 'settings', via: :all
  match 'net(/:action)', controller: 'sockets', via: :all

end
