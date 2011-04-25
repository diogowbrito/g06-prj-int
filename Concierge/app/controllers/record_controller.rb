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

    file = File.new('/home/pedro/RubymineProjects/Concierge/app/views/tests/index.xml')
    doc = REXML::Document.new file

    @title = doc.root.attributes.get_attribute("title")
    text_tags = []
    @attributes = []
    @test = []

    REXML::XPath.each(doc, "//text") {
      |ele|
      title = ele.attributes.get_attribute("title").value
      if ele.text.strip.length == 0
        text_tags << Element.new("text", ele.text, "", title)
        REXML::XPath.each(doc, "//text/entity") {
          |ent|
           text_tags << Element.new("link", ent.text)
        }
      else
        text_tags << Element.new("text", ele.text, "", title)
      end
    }

    @data = [text_tags]

    respond_to do |format|
      format.html
    end
  end

end
