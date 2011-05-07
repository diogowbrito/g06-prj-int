require 'rexml/document'
require 'open-uri'

class RecordController < ApplicationController

  def record
    @contents = URI.parse('http://localhost:3001/people/1.xml').read

    respond_to do |format|
      format.html
    end
  end

end
