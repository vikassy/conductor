namespace :conductor do
  namespace :install do
    desc 'Copy assets from plugin to application.'
    task :assets => :environment do
      cp Conductor::Engine.root.join('app/assets/stylesheets/conductor.css'), Rails.root.join('app/assets/stylesheets/conductor.css')
    end
  end
end
