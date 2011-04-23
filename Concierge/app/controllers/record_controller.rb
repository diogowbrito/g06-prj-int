class RecordController < ApplicationController

  def record

  @title = "Teste"
  ttest = Element.new("text", "texto1")
  ltest = Element.new("link", "texto2", "www.google.pt")
  ttest2 = Element.new("text", "texto3")
  ltest2 = Element.new("link", "texto4", "www.google.pt")
  arraytest = [ttest2, ltest2]
  listtest = EList.new("OMG Works!", arraytest)
  @data = [ttest, ltest, listtest]

    respond_to do |format|
      format.html
    end
  end

end
