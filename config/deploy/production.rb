# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

set :application, 'capella_rails_production'

set :ruby_version, '2.3.0'

set :domain, 'capella_rails.ssimon.capella.uberspace.de'

set :user, 'ssimon'

set :branch, 'master'

set :SECRET_TOKEN, '7d8f63afea54ee684201164844fd0f3eeee38be8c713d47a24311836c700a83287e3bb7f4908b5d28199b6e43e6c67104bde1cf24e6ad72105ffdcb11ec46b8c'
set :SECRET_KEY_BASE, '7d8f63afea54ee684201164844fd0f3eeee38be8c713d47a24311836c700a83287e3bb7f4908b5d28199b6e43e6c67104bde1cf24e6ad72105ffdcb11ec46b8c'

 server 'capella.uberspace.de',
   user: 'ssimon',
   roles: %w{web app cron db},
   primary: true,
   ssh_options: {
     keys: %w{~/.ssh/authorized_keys},
     forward_agent: true,
     auth_methods: %w(publickey)


   }

# server 'example.com', user: 'deploy', roles: %w{app db web}, my_property: :my_value
# server 'example.com', user: 'deploy', roles: %w{app web}, other_property: :other_value
# server 'db.example.com', user: 'deploy', roles: %w{db}
task :whoami do
  on roles(:all) do
    execute :whoami
  end
end


# role-based syntax
# ==================

# Defines a role with one or multiple servers. The primary server in each
# group is considered to be the first unless any  hosts have the primary
# property set. Specify the username and a domain or IP for the server.
# Don't use `:all`, it's a meta role.

# role :app, %w{deploy@example.com}, my_property: :my_value
# role :web, %w{user1@primary.com user2@additional.com}, other_property: :other_value
# role :db,  %w{deploy@example.com}



# Configuration
# =============
# You can set any configuration variable like in config/deploy.rb
# These variables are then only loaded and set in this stage.
# For available Capistrano configuration variables see the documentation page.
# http://capistranorb.com/documentation/getting-started/configuration/
# Feel free to add new variables to customise your setup.



# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult the Net::SSH documentation.
# http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
#
# The server-based syntax can be used to override options:
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
