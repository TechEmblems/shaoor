# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

role :app, %w{162.243.69.154}
role :web, %w{162.243.69.154}
role :db,  %w{162.243.69.154}, primary: true


# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

server '162.243.69.154', user: 'deploy', roles: %w{web app}, my_property: :my_value


# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start).
#
# Global options
# --------------
set :branch, 'master'
set :use_sudo, true
set :shell, '/bin/bash --login'
set :deploy_to, '/home/deploy/apps/regdevice'
set :deploy_via, :remote_cache
set :bluepill_bin, 'bluepill'
set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
   forward_agent: true
#    auth_methods: %w(password)
}

default_run_options[:pty] = true
default_run_options[:shell] = '/bin/bash --login'
ssh_options[:forward_agent] = true

after 'deploy:finalize_update', 'db:symlink'
after 'deploy:finalize_update', 'sockets:symlink'

namespace :db do
  task :symlink do
    run "rm -f #{release_path}/config/database.yml && ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

namespace :sockets do
  task :symlink do
    run "ln -nfs #{shared_path}/sockets #{release_path}/tmp/sockets"
  end
end

namespace :deploy do
  desc 'Start bluepill daemon'
  task :start do
    run "sudo #{bluepill_bin} load /etc/bluepill/#{application}.pill"
  end
  desc 'Stop bluepill daemon'
  task :stop do
    run "sudo #{bluepill_bin} #{application} stop"
  end
  desc 'Restart bluepill daemon'
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "sudo #{bluepill_bin} #{application} restart"
  end
  desc 'Show status of the bluepill daemon'
  task :status do
    run "sudo #{bluepill_bin} #{application} status"
  end
end



#
# And/or per server (overrides global)
# ------------------------------------
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
