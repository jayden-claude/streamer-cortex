# frozen_string_literal: true

Rails.application.routes.draw do
  resources :playlists, only: %i[index new show create] do
    resources :videos, only: %i[create destroy], module: 'playlists'
  end

  resources :videos, only: [:index]

  root 'videos#index'
end
