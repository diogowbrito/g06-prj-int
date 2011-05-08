class SearchController < ApplicationController

   def search

    @keyword =  params[:keyword].gsub("%", "\%").gsub("_", "\_")

    @services = Service.all

    @services.each do |service|
    @competence = service.competences.where(:competenceType = "search")
    @url = @competence.url
    @contents = URI.parse(@url+'?keyword='+@keyword).read
    end

    respond_to do |format|
      format.xml
    end
  end

end
