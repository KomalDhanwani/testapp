
# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

# RVM bootstrap

#$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require 'rvm/capistrano'
set :rvm_ruby_string, '1.9.3-p0'

# bundler bootstrap
require 'bundler/capistrano'
# main details
set :application, "mymobileapp"
role :web, "mymobileapp.komal.cs"
role :app, "mymobileapp.komal.cs"
role :db,  "mymobileapp.komal.cs", :primary => true

# server details
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :deploy_to, "/komal/shopdls_staging/deply_test/mymobileapp"
set :deploy_via, :remote_cache
set :user, "nikhil"
set :password, "nikhil"
set :use_sudo, false

# repo details
set :scm, :git
set :scm_username, "KomalDhanwani"
set :repository, "git@github.com:KomalDhanwani/testapp.git"
set :branch, "master"
set :git_enable_submodules, 1

# tasks
namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
end