ActionController::Routing::Routes.draw do |map|

  map.resources :committees, :board_members, :positions

  map.root :controller => 'home'
  map.login 'login', :controller => "user_sessions", :action => "new"
  map.logout 'logout', :controller => "user_sessions", :action => "destroy"
  map.resource :account, :controller => "users"
  
  map.invite_volunteer 'invite-volunteer/:id', :controller => 'users', :action => 'invite_volunteer'

  map.resources :users, :has_many => [:students, :assignments]
  map.resource :user_session
end
