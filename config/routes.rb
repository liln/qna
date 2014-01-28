Qanda::Application.routes.draw do
  devise_for :users
  resources :questions

  get 'questions/index'
  root to: 'questions#index'
end
