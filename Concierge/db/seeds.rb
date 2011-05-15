# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Service.create :serviceName => 'People', :provider => 'FCT', :type => 'bazinga', :ranking => 0, :url => 'http://localhost:3001', :imgPath => 'TODO'
Competence.create :competenceType => 'Home', :competenceUrl => 'http://localhost:3001/index', :description => "boraa", :service_id => '1'
Competence.create :competenceType => 'Search', :competenceUrl => 'http://localhost:3001/search', :description => "boraa", :service_id => '1'

Service.create :serviceName => 'People2', :provider => 'FCT', :type => 'bazinga', :ranking => 0, :url => 'http://localhost:3001', :imgPath => 'TODO'
Competence.create :competenceType => 'Home', :competenceUrl => 'http://localhost:3001/index', :description => "boraa", :service_id => '2'
Competence.create :competenceType => 'Search', :competenceUrl => 'http://localhost:3001/search', :description => "boraa", :service_id => '2'



Service.create :serviceName => 'CoursesAndDegrees', :provider => 'FCT', :type => 'bazinga', :ranking => 0, :url => 'http://localhost:3002', :imgPath => 'TODO'
Competence.create :competenceType => 'Home', :competenceUrl => 'http://localhost:3001/index', :description => "boraa", :service_id => '3'
Competence.create :competenceType => 'Search', :competenceUrl => 'http://localhost:3001/search', :description => "boraa", :service_id => '3'