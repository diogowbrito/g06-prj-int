class ListController < ApplicationController


    def list
      @service = params[:service]
      @method = params[:method]
      service = Service.where(:serviceName => @servicename)

      serviceurl = service[0].url
      link = "serviceurl" + method
      @doc = Nokogiri::XML(open(link),nil, 'UTF-8')
      respond_to :xml
  end


end