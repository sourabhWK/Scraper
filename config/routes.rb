Rails.application.routes.draw do
  resources :hockey_teams do
    match '/scrape', to: 'hockey_teams#scrape', via: :post, on: :collection
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "hockey_teams#index"
end
