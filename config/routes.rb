Rails.application.routes.draw do

  get 'users/new'

  get :signup, to: 'users#new' 

  resources :users, only: :create

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
