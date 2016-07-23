Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
    #下記の２つがあると、ログアウトがうまくいかなくなる。おそらく、実際にはない/users/sessions_controllerやusers/passwords_controllerを探しに行ってしまうから
    # sessions: "users/sessions",
    # password: "users/passwords",
  }
  
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

  match "*path" => "application#handle_404", via: :all
end
