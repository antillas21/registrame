set :spinner_user, "aantillon"
set :runner, "aantillon"
set :application, "registrame"
set :user, "aantillon"
set :password, "aima780804"
set :use_sudo, true

set :repository,  "git://github.com/antillas21/registrame.git"
set :deploy_to, "/var/www/#{application}"
set :scm, :git
set :git_enable_submodules, 1         # Make sure git submodules are populated

set :port, 22                      # The port you've setup in the SSH setup section
set :location, "192.168.1.129"
role :app, location
role :web, location
role :db,  location, :primary => true

namespace :deploy do
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Make symlink for database.yml" 
  task :symlink_dbyaml do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml" 
  end

  desc "Create empty database.yml in shared path" 
  task :create_dbyaml do
    run "mkdir -p #{shared_path}/config" 
    put '', "#{shared_path}/config/database.yml" 
  end

  desc "Make symlink for s3.yml" 
  task :symlink_s3yaml do
    run "ln -nfs #{shared_path}/config/s3.yml #{release_path}/config/s3.yml" 
  end

  desc "Create empty s3.yml in shared path" 
  task :create_s3yaml do
    run "mkdir -p #{shared_path}/config" 
    put '', "#{shared_path}/config/s3.yml" 
  end
end

after 'deploy:setup', 'deploy:create_dbyaml'
after 'deploy:update_code', 'deploy:symlink_dbyaml'

after 'deploy:setup', 'deploy:create_s3yaml'
after 'deploy:update_code', 'deploy:symlink_s3yaml'

after "deploy", "deploy:cleanup"
