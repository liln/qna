Qanda::Application.routes.draw do
  devise_for :users
  resources :questions
  root 'question#index'
end
