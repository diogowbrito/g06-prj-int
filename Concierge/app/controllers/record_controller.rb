require 'rexml/document'
require 'open-uri'

class RecordController < ApplicationController

  def record
#   /home/pedro/record.xml@contents = URI.parse('http://localhost:3001/people/1.xml').read

    respond_to do |format|
      format.html
      format.xml
    end
  end

end
