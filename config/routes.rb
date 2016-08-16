Rails.application.routes.draw do
  resources :tasks
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
    #下記の２つがあると、ログアウトがうまくいかなくなる。おそらく、実際にはない/users/
    #sessions_controllerやusers/passwords_controllerを探しに行ってしまうから
    # sessions: "users/sessions",
    # password: "users/passwords",
  }
  
  #"devise_for :users"よりも下に書く！
  resources :users, only: [:index, :show] do
    resources :tasks
    resources :submit_requests, shallow: true do
      get 'approve'
      get 'unapprove'
      get 'reject'
      collection do
        get 'inbox'
      end
    end
  end
  
  resources :relationships, only: [:create, :destroy]
  
  resources :blogs do
    resources :comments
    collection do
      post :confirm
    end
  end
  
  # post "/contacts/new" => "contactss#confirm"
  resources :contacts, only: [:new,:create] do
    collection do
      post :confirm
    end
  end
  
  #conversations/messages/番号という形になる
  resources :conversations do
    resources :messages
  end
  
  root :to => "top#index"

  match "*path" => "application#handle_404", via: :all
end