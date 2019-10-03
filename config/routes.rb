Rails.application.routes.draw do
  #  root to: 'questions#index' #set the Root route
  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    post :start, on: :member
  end

  #  GET /test_passages/101/result
  resources :test_passages, only: %i[show update] do

    get :result, on: :member
  end
end
