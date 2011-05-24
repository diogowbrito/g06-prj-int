
class SearchController < ApplicationController

   def search
    puts params[:keyword]
    @keyword =  params[:keyword].gsub("%", "\%").gsub("_", "\_").gsub(" ", "+")
    puts @keyword
    @start = (params[:start] || '1').to_i
    @end = (params[:end] || '20').to_i
    @type = params[:type]
    @entity = params[:entity]
    counter = 1

    if @type != nil then
      services = Service.where(:servicetype => @type).order(:ranking)
    elsif @entity != nil then
      entities = InfEntity.where(:entity => @entity)
      services = []
      entities.each do |entity|
        services << entity.service
      end
    else

    services = Service.order(:ranking)
    end
    list = []
    flag = 1
    services.each do |service|
      competence = service.competences.where(:competenceType => "Search")
      url = competence[0].competenceUrl
      homeurl = service.url
      name = service.serviceName
      puts url+'?keyword='+@keyword+"&start=1&end=5000"
      tempdoc = Nokogiri::XML(open(url+'?keyword='+@keyword+"&start=1&end=5000"),nil, 'UTF-8')
      temproot = tempdoc.at_css "list"
      temproot.add_child("<home>"+homeurl+"</home>")
      temproot.add_child("<name>"+name+"</name")
      list << tempdoc

    end

    @doc = Nokogiri::XML("<list title='"+@keyword+"'></list>")

    list.each do |result|

      homenodes = result.xpath("//home")
      homeurl = homenodes[0].content
      namenodes = result.xpath("//name")
      name = namenodes[0].content
      nodes = result.xpath("//item")

      nodes.each do |node|
        if counter >= @start then
        root = @doc.at_css "list"
        href = node['href']
        link = href.gsub(homeurl, "http://localhost:3000/services/"+name)
        node['href'] = link
          root.add_child(node)
        end
        counter = counter + 1
        if counter>@end then
          flag = 0
          break
        end
      end
      if flag == 0 then
        break
      end

    end

    respond_to :xml

   end

  def servicesearch

    @keyword =  params[:keyword].gsub("%", "\%").gsub("_", "\_").gsub(" ", "+")
    puts "boraa"
    puts "keyword: "+@keyword
    puts "params: "+params[:keyword]
    @start = (params[:start] || '1')
    @end = (params[:end] || '20')
    @servicename = params[:service]
    service = Service.where(:serviceName => @servicename)
    competence = service[0].competences.where(:competenceType => "Search")
    homeurl = service[0].url

    url = competence[0].competenceUrl
    @doc = Nokogiri::XML(open(url+'?keyword='+@keyword+"&start="+@start+"&end="+@end),nil, 'UTF-8')

    nodes = @doc.xpath("//item")

    nodes.each do |node|
      href = node['href']
      link = href.gsub(homeurl, "http://localhost:3000/services")
      node['href'] = link
    end

    respond_to :xml
  end

end
