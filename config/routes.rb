Rails.application.routes.draw do
  resources :courses
  root 'sessions#home'
  get '/signup' => "students#new"
  get '/login'=> "sessions#login"
  post '/login' =>"sessions#create"
  resources :students
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
