# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Service.create :serviceName => 'People', :provider => 'G06', :servicetype => 'academic', :ranking => 0, :url => 'http://localhost:3001', :imgPath => 'TODO'
Competence.create :competenceType => 'Home', :competenceUrl => 'http://localhost:3001/index', :description => "boraa", :service_id => '1'
Competence.create :competenceType => 'Search', :competenceUrl => 'http://localhost:3001/search', :description => "boraa", :service_id => '1'
InfEntity.create :entity => 'person', :service_id => '1'

Service.create :serviceName => 'CursosCadeiras', :provider => 'G06', :servicetype => 'academic', :ranking => 1, :url => 'http://localhost:3002', :imgPath => 'TODO'
Competence.create :competenceType => 'Home', :competenceUrl => 'http://localhost:3002/index', :description => "boraa", :service_id => '2'
Competence.create :competenceType => 'Search', :competenceUrl => 'http://localhost:3002/search', :description => "boraa", :service_id => '2'
InfEntity.create :entity => 'degree', :service_id => '2'
InfEntity.create :entity => 'course', :service_id => '2'