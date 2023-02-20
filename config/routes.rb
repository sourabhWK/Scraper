# frozen_string_literal: true

Rails.application.routes.draw do
  resources :hockey_teams do
    match '/scrape', to: 'hockey_teams#scrape', via: :post, on: :collection
    match '/upload', to: 'hockey_teams#upload', via: :post, on: :collection
    match '/download', to: 'hockey_teams#download', via: :post, on: :collection
  end

  root 'hockey_teams#index'
end
