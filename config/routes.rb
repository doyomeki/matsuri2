Matsuri2::Application.routes.draw do
  root "events#index"

  resources :events, only: [:index, :show] do
    resources :contents, only: [:index, :show]
  end

  namespace :admin do
    resources :events do
      resources :contents
    end
    resources :rooms
  end
end
