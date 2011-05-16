class ServiceForwardController < ApplicationController

  def homepagerequest

    @servicename = params[:service]
    service = Service.where(:serviceName => @servicename)
    competence = service[0].competences.where(:competenceType => "Home")
    homeurl = service[0].url
    @url = competence[0].competenceUrl
    @doc = Nokogiri::XML(open(@url), nil, 'UTF-8')
    nodes = @doc.xpath("//link")

    nodes.each do |node|
      href = node['href']
      link = href.gsub(homeurl, "http://localhost:3000/services/"+@servicename)
      node['href'] = link
    end

    root = @doc.at_css "record"
    root.add_child("<search>http://localhost:3000/services/"+@servicename+"/search?keyword=<search/>")

    respond_to :xml
  end

  def listrequest
    @servicename = params[:service]
    @method = params[:method]

    service = Service.where(:serviceName => @servicename)
    serviceurl = service[0].url

    @url = serviceurl +  "/" + @method
    @doc = Nokogiri::XML(open(@url), nil, 'UTF-8')
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
