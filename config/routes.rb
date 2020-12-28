Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

# Welcome
get '/', to: 'welcome#index'

# Session
get '/auth/github/callback', to: 'sessions#create'

# Dashboard
get '/dashboard', to: 'dashboard#show'
end
