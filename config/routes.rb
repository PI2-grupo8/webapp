Rails.application.routes.draw do

  root 'public#index'

  get 'measurements/index'
  get 'measurements/import'
  get '/measurements/humidity_heatmap' => 'measurements#humidity_heatmap'

  match 'settings(/:action)', controller: 'settings', via: :all

  resources :measurements do
    collection { post :import }
  end
end
