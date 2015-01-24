SandboxRb::Application.routes.draw do

  root :to => 'application#index'

  get '/auth/redbooth/callback', to: 'redbooth_accounts#signup_redbooth'

  resources :clients
  
end
