gem 'darkfish-rdoc'
require 'darkfish-rdoc'

Rake::RDocTask.new do |rdoc|
    rdoc.title    = "MyFantasticLibrary - a library of utter fantasticness"
    rdoc.rdoc_files.include 'README'

    rdoc.options += [
        '-SHN',
        '-f', 'darkfish',  # This is the important bit
      ]
end
