Rails.application.routes.draw do
  resources :hockey_teams do
    match '/scrape', to: 'hockey_teams#scrape', via: :post, on: :collection
  end
  
  root "hockey_teams#index"
end
