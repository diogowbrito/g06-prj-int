require 'rexml/document'

class ListController < ApplicationController

  def list

    file = File.new('/home/pedro/list.xml')
    doc = REXML::Document.new file

    @title = doc.root.attributes.get_attribute("title")
    list = []

    REXML::XPath.each(doc, "//item"){
        |ele|
        list << Element.new("link", ele.text, ele.attributes.get_attribute("href").value)
      }
      e_list = EList.new("List Test", list)

      @data = [e_list]

      respond_to do |format|
        format.html
      end
  end

end