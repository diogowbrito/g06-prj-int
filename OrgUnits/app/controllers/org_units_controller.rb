class OrgUnitsController < ApplicationController

  def meta_info
    respond_to :xml
  end

  def description
    respond_to :xml
  end
end
