Rails.application.routes.draw do
  get '/'                  => 'ideas#index', as: :idea_index
  post '/ideas/:id/kudos'  => 'ideas#kudos', as: :add_kudos
  resources :ideas, except: [:new, :edit, :show, :update]
end
