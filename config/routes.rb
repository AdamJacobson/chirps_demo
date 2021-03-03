Rails.application.routes.draw do
  root 'chirps#index'

  resources :chirps, only: [:create, :new, :index]

  post '/upvote/:chirp_id', controller: 'upvotes', action: 'upvote_chirp', as: 'upvote'
  delete '/upvote/:chirp_id', controller: 'upvotes', action: 'remove_upvote', as: 'remove_upvote'
end
