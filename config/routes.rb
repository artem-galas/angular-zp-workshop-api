Rails.application.routes.draw do
  resources :apidocs, only: [:index]
  get '/docs' => redirect('swagger-doc/index.html')


  namespace :api do
    resources :products
  end
end
