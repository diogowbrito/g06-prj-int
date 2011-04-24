require 'rexml/document'

class RecordController < ApplicationController

  def record

#  @title = "Teste"
#  ttest = Element.new("text", "texto1")
#  ltest = Element.new("link", "texto2", "www.google.pt")
#  ttest2 = Element.new("text", "texto3")
#  ltest2 = Element.new("link", "texto4", "www.google.pt")
#  arraytest = [ttest2, ltest2]
#  listtest = EList.new("OMG Works!", arraytest)
#  @data = [ttest, ltest, listtest]

#    file = File.new('/home/pedro/RubymineProjects/Concierge/app/views/tests/index.xml')
    file = File.new('/home/pedro/list.xml')
    doc = REXML::Document.new file

    @title = doc.root.attributes.get_attribute("title")
    text_tags = []
    @attributes = []
    list = []

    REXML::XPath.each(doc, "//text") {
      |ele|
      if ele.text.length == 1
        REXML::XPath.each(doc, "//text/entity") {
          |ent|
           text_tags << Element.new("link", ent.text)
        }
      else
        text_tags << Element.new("text", ele.text)
        @attributes << ele.attributes.get_attribute("title").value
      end

    }

    REXML::XPath.each(doc, "//item"){
      |ele|
      list << Element.new("link", ele.text, ele.attributes.get_attribute("href").value)
    }
    e_list = EList.new("List Test", list)
#     REXML::XPath.each(doc, "//entity") {
#      |ele|
#      entities << Element.new("link", ele.text)
#    }

    @data = [text_tags, e_list]

    respond_to do |format|
      format.html
    end
  end

end
