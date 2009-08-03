ActionController::Routing::Routes.draw do |map|
  map.resources :positions

  map.root :controller => 'home'
  map.login 'login', :controller => "user_sessions", :action => "new"
  map.logout 'logout', :controller => "user_sessions", :action => "destroy"
  map.resource :account, :controller => "users"
  map.resources :users
  map.resource :user_session
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
