
class SearchController < ApplicationController

   def search

    @keyword =  params[:keyword].gsub("%", "\%").gsub("_", "\_").gsub(" ", "+")
    @start = (params[:start] || '1').to_i
    @end = (params[:end] || '20').to_i
    counter = 1
    services = Service.order(:ranking)
    list = []
    flag = 0
    services.each do |service|

      competence = service.competences.where(:competenceType => "Search")
      url = competence[0].competenceUrl
      homeurl = service.url
      tempdoc = Nokogiri::XML(open(url+'?keyword='+@keyword+"&start=1&end=5000"),nil, 'UTF-8')
      temproot = tempdoc.at_css "list"
      temproot.add_child("<home>"+homeurl+"</home>")
      list << tempdoc

    end

    @doc = Nokogiri::XML("<list></list>")

    list.each do |result|

      homenodes = result.xpath("//home")
      homeurl = homenodes[0].content
      nodes = result.xpath("//item")

      nodes.each do |node|

        if counter >= @start then
        root = @doc.at_css "list"
        href = node['href']
        link = href.gsub(homeurl, "http://localhost:3000/services")
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
