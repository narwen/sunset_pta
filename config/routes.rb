ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'home'
  map.login 'login', :controller => "user_sessions", :action => "new"
  map.resource :account, :controller => "users"
  map.resources :users
  map.resource :user_session
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
