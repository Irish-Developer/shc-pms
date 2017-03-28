Rails.application.routes.draw do

  get 'doctors/new'

  get '/help', to:'static_pages#help'
  get '/about', to:'static_pages#about'
  get '/contact', to:'static_pages#contact'
  get '/signup', to: 'doctors#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'application#hello'
  root 'static_pages#home'
  
end
