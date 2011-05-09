class RecordController < ApplicationController

  def record

    @service = params[:service]
    @id = params[:id]
    respond_to :html

  end

  def recordAux
    @service = params[:service]
    @id = params[:id]
    @link = "http://localhost:3001/"+@service+"/"+@id
    @doc = Nokogiri::XML(open(@link), nil, 'UTF-8')

    respond_to :xml

  end

end
