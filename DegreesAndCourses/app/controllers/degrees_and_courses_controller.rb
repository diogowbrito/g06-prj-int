class DegreesAndCoursesController < ApplicationController

  def description
    respond_to do |format|
      format.xml
    end
  end

  def meta_info
    respond_to do |format|
      format.xml
    end
  end

  def search

      @keyword = params[:keyword].gsub("%", "\%").gsub("_", "\_")
      @start = params[:start] || '1'
      @end = params[:end] || '20'
      @degrees = Degree.find(:all, :conditions=> ["name like ?", "%" + @keyword + "%"], :offset => @start.to_i-1, :limit => @end.to_i+1-@start.to_i)
      @courses = Course.find(:all, :conditions=> ["name like ?", "%" + @keyword + "%"], :offset => @start.to_i-1, :limit => @end.to_i+1-@start.to_i)

      respond_to do |format|
        format.xml
      end
    end



end