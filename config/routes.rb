Rails.application.routes.draw do
  resources :apidocs, only: [:index]
  get '/docs' => redirect('swagger-doc/index.html')


  namespace :api, constraints: { format: 'json' } do
    resources :products
    post 'auth/sign_in', to: 'auth#sign_in'
    get 'auth/load_user', to: 'auth#load_user'
    get '/profile', to: 'profile#show'
    put '/profile/avatar', to: 'profile#update_avatar'
  end
end
