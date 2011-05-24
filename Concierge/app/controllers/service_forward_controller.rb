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

    @url = serviceurl + "/" + @method
    @doc = Nokogiri::XML(open(@url), nil, 'UTF-8')

    nodes = @doc.xpath("//item")

    nodes.each do |node|
      href = node['href']
      link = href.gsub(serviceurl, "http://localhost:3000/services/"+@servicename)
      node['href'] = link
    end

    respond_to :xml
  end


  def recordrequest

    @servicename = params[:service]
    @id = params[:id]
    @method = params[:method]


    service = Service.where(:serviceName => @servicename)
    serviceurl = service[0].url

    link = serviceurl + "/" +@method+"/"+@id

    @doc = Nokogiri::XML(open(link), nil, 'UTF-8')

    entity = @doc.xpath("//entity");
    entity.each do |node|

      parent = node.parent()
      kind = node.attr('kind')
      service = node.attr('service')
      serviceType = node.attr('serviceType')
      title = node.attr('title')
      value = node.text()

      node.remove
      plus_value = value.gsub(" ", "+")
      puts request.port
      puts request.host
      link = 'http://localhost:3000/'

      if service != nil then
        link += 'services/'+service+'search?keyword='+plus_value
      elsif kind != nil then
        plus_kind = kind.gsub(" ", "+")
        link += 'search?keyword='+plus_value+'&amp;entity='+plus_kind
      else
        plus_serviceType = servie.gsub(" ", "+")
        link += 'search?keyword='+plus_value+'&amp;type='+plus_serviceType
      end

      if title == nil
        parent.add_child('<entity href="'+link+'">'+value+'</entity>')
      else
        parent.add_child('<entity title="'+title+'" href="'+link+'">'+value+'</entity>')
      end

    end

    link_tag = @doc.xpath("//link")
    link_tag.each do |node|

      href = node['href']
      if href == nil then
        node.name = "external_link"
        href = node['ehref']
      end
      link = href.gsub(serviceurl, "http://localhost:3000/services/"+@servicename)
      node['href'] = link

    end
  end

  respond_to :xml

end
