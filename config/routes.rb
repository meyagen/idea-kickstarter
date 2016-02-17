Rails.application.routes.draw do
  get '/' => 'to_dos#index', as: :todo_index
  resources :to_dos
end
