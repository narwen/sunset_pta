ActionController::Routing::Routes.draw do |map|
  map.resource :account, :controller => "users"
  map.resources :users
  map.resource :user_session
  map.login 'login', :controller => "user_sessions", :action => "new"
  map.root :controller => "home"
end
