Rails.application.routes.draw do
  resources :users, :students, :teachers, :employees
  resources :students do
    get 'enrollments', on: :member
  end
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'teachers/index'
  get 'students/index'
  delete '/user', to: 'users#destroy'
  post 'students/new', to: 'students#create'
end
