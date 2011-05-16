class RecordController < ApplicationController

  def record

    @service = params[:service]
    @id = params[:id]
    @link = "http://localhost:3001/"+@service+"/"+@id

    @tempdoc = Nokogiri::XML(open(@link), nil, 'UTF-8')

    respond_to do |format|
      format.xml
      format.html
    end


  end

end
