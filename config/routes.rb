Rails.application.routes.draw do
  devise_for :users, controllers: {
     sessions: 'public/sessions',
     registrations: 'public/registrations'
  }
  scope module: :public do
    get 'users/confirm', to: 'users#confirm'
    get 'users/withdraw', to: 'users#withdraw'
    get 'works/my_works', to: 'works#my_works'
    get 'works/:id/self_work_entries', to: 'works#my_work_entries', as: 'self_work_entries'
    get 'favorites', to: 'favorites#index'
    get 'book_marks', to: 'book_marks#index'
    post 'entries/scout', to: 'entries#scout'
    resources :entries, only: [:show, :create, :index, :update]
    resources :portfolios, only: [:new, :create, :edit, :destroy, :update]
    resources :users, only: [:show, :edit, :update, :destroy, :index]
    resources :messages, only: [:create]
    resources :rooms, only: [:show, :index]
    resources :employer_evaluations, only: [:create]
    resources :labor_evaluations, only: [:create]
    resources :posts, only: [:show, :create, :destroy, :index] do
      resource :favorites, only: [:create, :destroy, :index]
    end
    resources :works do
      resource :book_marks, only: [:create, :destroy]
    end
  end

  devise_for :admin, :controllers => {
     sessions: 'admin/sessions',
  }

  root 'home#top'
  get 'about', to: 'home#about'
  get 'contact', to: 'home#contact'
end
