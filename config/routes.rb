Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :segments, except: [:new, :edit]

  get 'segments/nearby', to: 'segments#nearby'
end
