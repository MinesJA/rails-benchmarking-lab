Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'query#index'
  get 'query', to: 'query#index'
  get 'history', to: 'history#index'

end
