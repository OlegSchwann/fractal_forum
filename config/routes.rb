Rails.application.routes.draw do
  root 'page#show'
  get '/comment/:id', to: 'page#show'
  post '/add/comment', to: 'add_comment#add'
  get '/user/new'
  post '/user/create'
  post '/user/login'
  post '/user/departed_user'
end

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
