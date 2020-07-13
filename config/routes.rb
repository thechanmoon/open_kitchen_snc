Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #resources :users , only: [:new, :create]
  resources :users
  resources :restaurants
  #resources :comments, except: [:new]
  resources :posts, except: [:new, :create] do
    resources :comments, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  #get '/posts/:post_id/comments/new', to :'comments#new', as: 'new_comment'
  get '/posts/new/:id', to: 'posts#new', as:'new_post'
  post '/posts/:id', to: 'posts#create'

  get '/posts/:post_id/likes/new', to:'likes#new', as: 'post_like'
  post '/posts/:post_id/likes/new', to:'likes#create'

  delete '/posts/:post_id/likes/:id', to: 'likes#destroy'

  # post '/likes/:id', to: 'likes#create'
  # delete '/likes/:id', to: 'likes#delete'

  #get '/posts/:post_id/likes/new', to:'likes#new', as: 'new_like'
  

  # get '/comments/edit/:id', to: 'comments#edit', as:'edit_comment'
  # patch '/comments/:id', to: 'comments#update'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  get '/welcome' => 'welcome#home'
  get '/error' => 'welcome#error'
  get '/admin' => 'welcome#admin'

  get '/analytics' => 'analytics#index'


  root 'posts#index'
end
