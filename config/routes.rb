GettextExampleRails::Application.routes.draw do
  resources :cars
  root :to => "cars#index"
end
