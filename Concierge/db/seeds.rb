# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Service.create :serviceName => 'Pessoas', :provider => 'FCT', :type => 'bazinga', :ranking => 0, :url => 'http://localhost:3001', :imgPath => 'TODO'
Service.create :serviceName => 'Curso Cadeiras', :provider => 'FCT', :type => 'badjoras', :ranking => 0, :url => 'http://localhost:3001', :imgPath => 'TODO'
Service.create :serviceName => 'Servico 3', :provider => 'FCT', :type => 'badjoras', :ranking => 0, :url => 'http://localhost:3001', :imgPath => 'TODO'
Service.create :serviceName => 'Servico 4', :provider => 'FCT', :type => 'badjoras', :ranking => 0, :url => 'http://localhost:3001', :imgPath => 'TODO'
Service.create :serviceName => 'Servico 5', :provider => 'FCT', :type => 'badjoras', :ranking => 0, :url => 'http://localhost:3001', :imgPath => 'TODO'
Service.create :serviceName => 'People', :provider => 'FCT', :type => 'bazinga', :ranking => 0, :url => 'http://localhost:3001', :imgPath => 'TODO'
Competence.create :competenceType => 'Home', :competenceUrl => 'http://localhost:3001/index', :description => "boraa", :service_id => '6'