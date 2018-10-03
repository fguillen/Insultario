Rails.application.routes.draw do
  namespace :front do
    resources :users, :only => [:create] do
      resources :insults, :only => [:index, :show] do
        get 'random', :on => :collection
        put 'mark_as_readed', :on => :member
        put 'mark_as_loved', :on => :member
        put 'mark_as_unloved', :on => :member
      end
    end
  end

  namespace :admin do
    resources :insults, :only => [:create]
  end
end
