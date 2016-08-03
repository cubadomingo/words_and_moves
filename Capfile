# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require 'capistrano/nvm'
require "capistrano/deploy"
require 'capistrano/npm'



# Include tasks from other gems included in your Gemfile
require 'capistrano/rvm'
require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
require 'capistrano/passenger'



set :nvm_node, 'v6.3.1'


# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
