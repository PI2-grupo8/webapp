Rails.application.routes.draw do

  root 'application#index'

  get 'measurements/index'
  get 'measurements/import'
  get '/measurements/humidity_heatmap' => 'measurements#humidity_heatmap'

  match 'settings(/:action)', controller: 'settings', via: :all

  resources :measurements do
    collection { post :import }
  end
  match 'calibration(/:action)', controller: 'calibration', via: :all
  match 'net(/:action)', controller: 'sockets', via: :all
  #post '/calibration' => 'calibration#create'

end
