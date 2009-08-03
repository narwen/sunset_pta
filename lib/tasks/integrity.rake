namespace :test do 
  task :move_db_config do 
    require 'ftools'
    File.copy(RAILS_ROOT+"/config/database.yml.example", RAILS_ROOT+"/config/database.yml")
  end 
end

task :integrity => ['test:move_db_config', 'db:migrate', 'db:test:clone', 'features', 'spec']
