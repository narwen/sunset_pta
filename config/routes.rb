ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'home'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
