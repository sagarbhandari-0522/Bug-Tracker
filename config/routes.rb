# frozen_string_literal: true

Rails.application.routes.draw do
  # resources :dashboards
  devise_for :users
  resources :projects do
    resources :bugs
  end
  resources :developers
  post '/assign_ticket_developer', to: 'projects#assign_ticket', as: 'assign_ticket_developer'
  get '/project_manager/:id', to: 'dashboards#project_manager', as: 'project_manager'
  get '/develop/:id', to: 'dashboards#developer', as: 'develop'
  get '/tester/:id', to: 'dashboards#tester', as: 'tester'
  get '/dashboards', to: 'dashboards#index', as: 'dashboards'
  get '/bug/:id', to: 'projects#assign', as: 'assign'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root 'welcome_page#index'
end
