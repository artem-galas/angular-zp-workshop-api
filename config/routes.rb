Rails.application.routes.draw do
  resources :apidocs, only: [:index]
  get '/docs' => redirect('swagger-doc/index.html')


  namespace :api do
    resources :products
    post 'auth/sign-in', to: 'auth#sign_in'
    get '/profile', to: 'profile#show'
  end
end
