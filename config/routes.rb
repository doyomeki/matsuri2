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

  namespace :admin do
    resources :booths
    resources :events do
      resources :contents
    end
  end
end
