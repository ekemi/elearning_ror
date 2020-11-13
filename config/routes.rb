Rails.application.routes.draw do
  resources :courses
  root 'sessions#home'
  get '/signup' => "students#new"
  post '/signup' =>"students#create"

  get '/login'=> "sessions#new"
  post '/login' =>"sessions#create"
  delete '/logout' =>"sessions#destroy"
  
  get '/auth/google_oauth2/callback' => "sessions#google"
  resources :students
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
