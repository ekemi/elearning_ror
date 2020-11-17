Rails.application.routes.draw do
  resources :reviews
  #resources :courses
  root 'sessions#home'
  get '/signup' => "students#new"
  post '/signup' =>"students#create"

  get '/login'=> "sessions#new"
  post '/login' =>"sessions#create"
  delete '/logout' =>"sessions#destroy"
  
  get '/auth/google_oauth2/callback' => "sessions#google"
  resources :reviews
  resources :students do
    resources :courses
  end
  resources :courses do
    resources :reviews
  end

get '*path' =>'sessions#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
