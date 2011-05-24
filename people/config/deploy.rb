


#################
#    Application
#################

set :application, "people"
set :repository,  "svn+ssh://pi2011@193.136.122.76/var/www/repository/people/"
set :deploy_to, "var/www/repository/people/"

set :scm, :subversion
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

###############
#   Server Configs
################

server "193.136.122.76", :app, :web, :db, :primary => true

set :user, "pi2011"
set :use_sudo, true 


##################
# Passenger crlh
##################

#namespace :passenger do
#	desc "Restart Application"
#	task :restart do
#		run "touch #{current_path}/tmp/restart.txt
#	end
#end

#after :deploy, "passenger:restart"



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
