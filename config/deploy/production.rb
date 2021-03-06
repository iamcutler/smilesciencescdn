# The following MUST be defined in the /config/deploy/:stage.rb file:
# default_environment['PATH']= # This is the $PATH environment variable for the host systems
# set :application_directory   # This is the directory being deployed to in the deployment environment
# set :rails_env               # This is the $RAILS_ENV environment variable, should be the same as the stage name
# set :main_server             # This is the name of the main server we will be deploying on

default_environment['PATH']='your_paths'
set :application_directory, "smilecdn"
set :rails_env, "production"
set :main_server, 'smilesciencescdn.com'

#Git Information
set :branch, 'release' # probably master

# Do not modify
# Set up the server
server "#{main_server}", :web, :app, :db, :primary => true
set :deploy_to,   "/home/smilecdn/#{application_directory}"