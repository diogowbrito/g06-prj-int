class ServiceForwardController

  def listrequest
    @service = params[:service]
    @link = "http://localhost:3001/"+@service + ".xml"
    @doc = Nokogiri::XML(open(@link), nil, 'UTF-8')
    respond_to :xml
  end


  def recordrequest
    @service = params[:service]
    @id = params[:id]
    @link = "http://localhost:3001/"+@service+"/"+@id
    @doc = Nokogiri::XML(open(@link), nil, 'UTF-8')

    respond_to :xml

  end


end