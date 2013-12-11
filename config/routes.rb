Matsuri2::Application.routes.draw do
  devise_for :users, :controllers => { :sessions => 'users/sessions', :registrations => 'users/registrations'},
    :path_names => { :sign_in => 'login',
      :sign_out => 'logout',
      :password => 'secret',
      :confirmation => 'verification',
      :unlock => 'unblock',
      :registration => 'register',
      :sign_up => 'cmon_let_me_in'
  }
  root "events#index"

  resources :events, only: [:index, :show] do
    resources :contents, only: [:index, :show]
  end

  resources :entries do
    post "/insert_and_delete" => "entries#insert_and_delete", on: :collection
  end

  namespace :admin do
    resources :booths
    resources :events do
      post "/set_upcoming" => "events#set_upcoming", on: :collection
      resources :contents
    end
    resources :users
  end

end
