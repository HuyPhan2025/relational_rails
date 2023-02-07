Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/schools', to: 'schools#index'
  get '/schools/new', to: 'schools#new'
  post '/schools', to: 'schools#create'
  get '/schools/:id/edit', to: 'schools#edit'
  get '/schools/:id', to: 'schools#show'
  get '/schools/:school_id/students', to: 'schools/students#index'
  patch '/schools/:id', to: 'schools#update'
  get '/schools/:school_id/students/new', to: 'schools/students#new'
  post '/schools/:school_id/students', to: 'schools/students#create'
  get '/schools/:school_id/students/filter', to: 'schools/students#filter'
  delete '/schools/:id', to: 'schools#destroy'

  get '/students', to: 'students#index'
  get '/students/:id', to: 'students#show'
  get '/students/:id/edit', to: 'students#edit'
  patch '/students/:id', to: 'students#update'
  delete '/students/:id', to: 'students#destroy'
end
