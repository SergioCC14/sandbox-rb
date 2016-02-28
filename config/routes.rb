SandboxRb::Application.routes.draw do

  root :to => 'application#index'

  get '/auth/redbooth', :as => 'login_redbooth'
  get '/auth/redbooth/callback', to: 'redbooth_accounts#signup_redbooth'
  get '/signout', :to => 'application#signout', :as => 'signout'
  get '/sessions', :to => 'sessions#index', :as => 'login', :path => '/login'

  resources :clients
  resources :projects do
    member do
      resources :task_lists
    end
  end

  resources :tasks

  delete '/task_lists/:id', :to => 'task_lists#destroy', :as => 'delete_task_list'
  delete '/task/:id', :to => 'tasks#destroy', :as => 'delete_task'

end
