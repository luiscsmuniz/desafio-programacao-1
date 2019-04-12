Rails.application.routes.draw do
  root to: 'upload#index'

  post 'upload/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
