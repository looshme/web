default_run_options[:pty] = true
  set :repository,  "https://github.com/looshme/web.git"
  set :scm, "git"
  set :branch, "master"
  set :deploy_via, :remote_cache

  set :application, "realwebsite"
  set :deploy_to, "/Library/WebServer/Documents/#{application}"
  set :user, "admin"
  set :admin_runner, "admin"

set :scm, :subversion
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "isengard.real-sec.local"                          # Your HTTP server, Apache/etc
role :app, "isengard.real-sec.local"                          # This may be the same as your `Web` server
role :db,  "isengard.real-sec.local", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
  namespace :deploy do
    desc "Restart Application"
    task :restart, :roles => :app do
      run "touch #{current_path}/tmp/restart.txt"
    end
    desc "Start Application -- not needed for Passenger"
    task :start, :roles => :app do
      # nothing -- need to override default cap start task when using Passenger
    end
  end