Rails.application.routes.draw do
  devise_for :users, controllers: {
     sessions: 'public/sessions',
     registrations: 'public/registrations'
  }
  devise_for :admin, :controllers => {
     sessions: 'admin/sessions',
  }

  root 'home#home'
  get 'about', to: 'home#about'
  get 'contact', to: 'home#contact'
end
