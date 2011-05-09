
class SearchController < ApplicationController

   def search

    @keyword =  params[:keyword].gsub("%", "\%").gsub("_", "\_")
    @services = Service.all
    @list = []

    @services.each do |service|

    @competence = service.competences.where(:competenceType => "Search")
    @url = @competence[0].competenceUrl
    @list << Nokogiri::XML(open(@url+'?keyword='+@keyword),nil, 'UTF-8')

    end
     respond_to :xml
   end

  def servicesearch

    @keyword =  params[:keyword].gsub("%", "\%").gsub("_", "\_")
    @service = Service.where(:serviceName => params[:service])
    @competence = @service[0].competences.where(:competenceType => "Search")
    @url = @competence[0].competenceUrl
    @doc = Nokogiri::XML(open(@url+'?keyword='+@keyword),nil, 'UTF-8')
    respond_to :xml

  end

end
