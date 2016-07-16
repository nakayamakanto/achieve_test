Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :blogs, only: [:index, :new, :create, :edit, :update, :destroy, :show] do
    collection do
      post :confirm
    end
  end
  
  # post "/blogs/new" => "blogs#confirm"
  resources :contacts, only: [:new,:create] do
    collection do
      post :confirm
    end
  end
  
  root "top#index"
end
