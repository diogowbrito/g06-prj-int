class ListController < ApplicationController


    def list
       @service = params[:service]
      @id = params[:id]
      @link = "http://localhost:3001/"+@service+".xml/"
      @doc = Nokogiri::XML(open(@link),nil, 'UTF-8')
      respond_to :xml
  end

end