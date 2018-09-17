Rails.application.routes.draw do
  namespace :front do
    resources :insults, :only => [:show] do
      get 'random', :on => :collection
    end
  end

  namespace :admin do
    resources :insults, :only => [:create]
  end
end
