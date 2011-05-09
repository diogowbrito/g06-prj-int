
class SearchController < ApplicationController

   def search

    @keyword =  params[:keyword].gsub("%", "\%").gsub("_", "\_")

    @services = Service.all

    @services.each do |service|
    competence = service.competences.where(:competenceType => "search")
    @url = @competence.competenceUrl
    @contents = URI.parse(@url+'?keyword='+@keyword).read
    end

    respond_to do |format|
      format.xml
    end
   end

  def servicesearch

    @keyword =  params[:keyword].gsub("%", "\%").gsub("_", "\_")
    @service = Service.where(:serviceName => params[:service])
    @competence = @service[0].competences.where(:competenceType => "Search")
    @url = @competence[0].competenceUrl
    @contents = URI.parse(@url+'?keyword='+@keyword).read

    respond_to do |format|
      format.xml { render :xml => @contents }
    end
  end

end
