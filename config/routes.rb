Rails.application.routes.draw do
  
  get '/my_profile', to: 'user#my_profile', as: 'my_profile'
  get '/users/:id/profile', to: 'user#profile', as: 'user_profile'

  devise_for :users

  get '/posts/search(/:start_lease/:end_lease)', to: 'posts#search', as: 'post_search'
  
  resources :posts
	resources :charges
	resources :payments

  post '/request/:post_id', to: 'requests#create', as: 'new_request'
  # delete '/request/:id', to: 'requests#destroy', as: 'delete_request'
  post '/request/:id/unconfirm', to: 'requests#remove_confirmation', as: 'unconfirm_request'
  post '/request/:id/decline', to: 'requests#decline', as: 'decline_request'
  post 'request/:id/accept_and_contact', to: 'requests#accept_and_contact' , as: 'accept_request_and_contact'

  get '/about', to: 'static#about'
  get '/faq', to: 'static#faq'
  get '/contact', to: 'static#contact'
	get '/payment/success', to: 'static#payment_success', as: 'payment_success'

  root 'static#home'
end
