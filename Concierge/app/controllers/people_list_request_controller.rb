require 'open-uri'

class PeopleListRequestController < ApplicationController


  def peoplelistrequest

      @contents = URI.parse('http://localhost:3001/people.xml').read

      respond_to do |format|
        format.html
        format.xml
      end
  end

end