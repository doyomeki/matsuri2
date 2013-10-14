Matsuri2::Application.routes.draw do
  devise_for :users
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
