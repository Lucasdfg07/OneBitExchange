Rails.application.routes.draw do
  get 'bitcoins', to: 'bitcoins#convert'
  get 'bitcoins/index'
  root 'exchanges#index'
  get 'convert', to: 'exchanges#convert'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
