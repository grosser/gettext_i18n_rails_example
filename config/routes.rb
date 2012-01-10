GettextExampleRails::Application.routes.draw do
  
  #templating engines testing pages
  match '/templating_engine/haml' => 'templating_engines#haml', :as => 'haml'
  match '/templating_engine/slim' => 'templating_engines#slim', :as => 'slim'

  resources :cars
  root :to => "cars#index"
end
