Rails.application.routes.draw do
  
  get '/my_profile', to: 'user#my_profile', as: 'my_profile'
  get '/users/:id/profile', to: 'user#profile', as: 'user_profile'

  devise_for :users

  get '/posts/search(/:start_lease/:end_lease)', to: 'posts#search', as: 'post_search'
  
  resources :posts

  post '/request/:post_id', to: 'requests#create', as: 'new_request'
  # delete '/request/:id', to: 'requests#destroy', as: 'delete_request'
  post '/request/:id/unconfirm', to: 'requests#remove_confirmation', as: 'unconfirm_request'
  post '/request/:id/decline', to: 'requests#decline', as: 'decline_request'
  get '/payment', to: 'static#payment', as: 'payment'
  post 'request/:id/accept_and_contact', to: 'requests#accept_and_contact' , as: 'accept_request_and_contact'

  root 'static#home'
end
