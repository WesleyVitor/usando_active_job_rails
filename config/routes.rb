#require 'sidekiq/web'

Rails.application.routes.draw do
  
  resources :reports , :only => [:index,:create]
  
  # Não deixe esta url visivel quando estiver em production
  # mount Sidekiq::Web => '/sidekiq'
end
