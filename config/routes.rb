GettextExampleRails::Application.routes.draw do |map|
  resources :cars
  root :to => "cars#index"
end