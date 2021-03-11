Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:create] do
    collection do
      post :login
    end
  end

  resources :discussion_topics, only: [:create] do
    member do
      post :add_comment
    end
  end
  resources :comments,          only: [:create]
  resources :tags,              only: [:create]
  resources :campaigns,         only: [:create] do
    member do
      post :add_comment
    end
  end
end
