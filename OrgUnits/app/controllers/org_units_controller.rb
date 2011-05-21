class OrgUnitsController < ApplicationController

  def meta_info
    respond_to :xml
  end

  def description
    respont_to :xml
  end
end
