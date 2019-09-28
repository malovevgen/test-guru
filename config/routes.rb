Rails.application.routes.draw do
  #root to: 'questions#index' #set the Root route
  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end
  end
end
