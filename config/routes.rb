Rails.application.routes.draw do

  root to: 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'about', to: 'home#about'

  get 'talks/:id/new', to: 'talks#answer_new'
  patch 'talks/:id/create', to: 'talks#answer_create'
  resources :talks
end
