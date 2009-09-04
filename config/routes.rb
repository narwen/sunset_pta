ActionController::Routing::Routes.draw do |map|
  map.resources :board_members

  map.resources :positions

  map.root :controller => 'home'
  map.login 'login', :controller => "user_sessions", :action => "new"
  map.logout 'logout', :controller => "user_sessions", :action => "destroy"
  map.resource :account, :controller => "users"

  map.resources :users, :has_many => :students
  map.resource :user_session
end
