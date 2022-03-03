Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :welcome, except: [:show]
  resources :results, except: [:show]

  post 'welcome/search', to: 'welcome#search'

  get "api/distance/closest_venues", to: "api/distance#closest_venues"

end
