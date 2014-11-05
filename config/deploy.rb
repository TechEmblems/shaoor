# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'regdevice'
set :repo_url, 'git@github.com:shahroon/shaoor.git'

# Default branch is :master
set :branch, 'production'

set :rbenv_type, :system
set :rbenv_ruby, '2.1.3'
set :rbenv_path, '/opt/rbenv'
# set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/home/deploy/apps/regdevice'
set :use_sudo, true
set :bluepill_bin, 'bluepill'
# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  before 'deploy:compile_assets', :symlink_db
  # before 'deploy:compile_assets', :symlink_sockets

  desc 'Symlinks for sockets'
  task :symlink_sockets do
    on roles(:app) do
      execute "ln -nfs #{shared_path}/sockets #{release_path}/tmp/sockets"
    end
  end

  desc 'Symlinks config file for database.yml'
  task :symlink_db do
    on roles(:app, :db) do
      execute "rm -f #{release_path}/config/database.yml && ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), :in => :groups, :limit => 3, :wait => 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
end

after "deploy:update", "bluepill:stop", "bluepill:start"
namespace :bluepill do
  desc "Stop bluepill deamon"
  task :stop, :roles => [:app] do
    execute "sudo #{bluepill_bin} #{application} stop"
  end

  desc "Start bluepill deamon"
  task :start, :roles => [:app] do
    execute "sudo #{bluepill_bin} load /etc/bluepill/#{application}.pill"
  end
    
  desc "Restart bluepill daemon"
  task :restart, :roles => :app, :except => {:no_release => true} do
    execute "sudo #{bluepill_bin} #{application} restart"
  end

  desc "Status bluepill deamon"
  task :status, :roles => [:app] do
    execute "sudo #{bluepill_bin} #{application} status"
  end
end