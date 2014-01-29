Qanda::Application.routes.draw do
  devise_for :users
  resources :questions
  resources :users, only: :show

  get 'questions/index'
  root to: 'questions#index'
end
