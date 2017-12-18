Rails.application.routes.draw do
  resources :users, :students, :teachers, :employees, :departments, :courses, :student_course_enrollments, :teacher_courses, :courseworks, :student_courseworks, :course_notes, :lectures
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
  delete '/user', to: 'users#destroy'
  get 'students/index'
  post 'students/new', to: 'students#create'
  get 'teachers/index'
  post 'teachers/new', to: 'teachers#create'
  get 'departments/index'
  post 'departments/new', to: 'departments#create'
  get 'courses/index'
  post 'courses/new', to: 'courses#create'
end
