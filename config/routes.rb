Rails.application.routes.draw do
  #root to: 'questions#index' #set the Root route
  resources :tests do
    resources :questions, except: :index, shallow: true
  end
end 
