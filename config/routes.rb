# frozen_string_literal: true

Rails.application.routes.draw do
  #resources :dashboards
  devise_for :users
  get '/project_manager/:id', to: 'dashboards#project_manager', as: 'project_manager'
  get '/developer/:id', to: 'dashboards#developer', as: 'developer'
  get '/tester/:id', to: 'dashboards#tester', as: 'tester'
  get '/dashboards', to: 'dashboards#index', as: 'dashboards'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'welcome_page#index'
end
