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
    resources :entries, only: [:show, :create, :index]
    resources :users, only: [:show, :edit, :update, :destroy, :index]
    resources :messages, only: [:create]
    resources :rooms, only: [:show]
    resources :posts, only: [:show, :create, :destroy, :index] do
      resource :favorites, only: [:create, :destroy]
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
