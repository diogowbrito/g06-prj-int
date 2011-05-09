class RecordController < ApplicationController

  def record
    respond_to do |format|
      format.html
      format.xml
    end
  end

end
