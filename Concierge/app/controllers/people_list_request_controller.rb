class PeopleListRequestController < ApplicationController


  def peoplelistrequest

      @doc = Nokogiri::XML(open("http://localhost:3001/people.xml"),nil, 'UTF-8')
      respond_to :xml
  end


  def people

  end

end