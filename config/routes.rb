
Rails.application.routes.draw do
  devise_for :users
  root "flowers#index"

  resources :flowers do
    collection do
      delete :destroy_all
    end
  end

  get "about", to: "pages#about"
end
