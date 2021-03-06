Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/segments/nearby', to: 'segments#nearby'

  get '/genres/:id/segments', to: 'genres#segments', as: :genre_segments

  get '/genres/query', to: 'genres#query', as: :genre_query

  resources :genres, only: [:index]
  resources :segments, except: [:new, :edit]
  # resources :genres, except: [:new, :create, :delete, :edit]

end
