# frozen_string_literal: true

Rails.application.routes.draw do
  root 'administration/items#index'

  get '/home', to: 'home#landing_page'

  namespace 'administration' do
    resources :items
  end
end
