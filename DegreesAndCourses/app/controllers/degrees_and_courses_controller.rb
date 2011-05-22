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

      puts params[:keyword]
      @keyword = params[:keyword].gsub("%", "\%").gsub("_", "\_")
      @start = params[:start] || '1'
      @end = params[:end] || '20'
      @next = @end.to_i+1
      keyarray = @keyword.to_s.split(' ')
      degrees = Degree.find(:all, :order => "name", :conditions=> ["name like ?", "%" + @keyword + "%"])
      courses = Course.find(:all, :order => "name", :conditions=> ["name like ?", "%" + @keyword + "%"])

      keyarray.each do |key|
        degreestemp = Degree.find(:all, :order => "name", :conditions=> ["name like ?","%"+key+"%"])
        degreestemp.each do |dtemp|
          if !degrees.include?(dtemp) then
            degrees << dtemp
          end
        end
      end

      keyarray.each do |key|
        coursestemp = Course.find(:all, :order => "name", :conditions=> ["name like ?","%"+key+"%"])
        coursestemp.each do |ctemp|
          if !courses.include?(ctemp) then
            courses << ctemp
          end
        end
      end

      @degreelist = []
      @courselist = []
      counter = 1

      degrees.each do |degree|
        if counter >= @start.to_i && counter <= @end.to_i then
          @degreelist << degree
        end
        counter = counter + 1
      end

      courses.each do |course|
        if counter >= @start.to_i && counter <= @end.to_i then
          @courselist << course
        end
        counter = counter + 1
      end

   if @degreelist.count+@courselist.count != 20 then
      @next = ""
   end

   respond_to do |format|
      format.xml
    end

  end

  def specificsearch

    puts params[:keyword]
      @keyword = params[:keyword].gsub("%", "\%").gsub("_", "\_")
      @start = params[:start] || '1'
      @end = params[:end] || '20'
      @next = @end.to_i+1
      keyarray = @keyword.to_s.split(' ')
      degrees = Degree.find(:all, :order => "name", :conditions=> ["name like ?", "%" + @keyword + "%"])
      courses = Course.find(:all, :order => "name", :conditions=> ["name like ?", "%" + @keyword + "%"])

      @degreelist = []
      @courselist = []
      counter = 1

      degrees.each do |degree|
        if counter >= @start.to_i && counter <= @end.to_i then
          @degreelist << degree
        end
        counter = counter + 1
      end

      courses.each do |course|
        if counter >= @start.to_i && counter <= @end.to_i then
          @courselist << course
        end
        counter = counter + 1
      end

   if @degreelist.count+@courselist.count != 20 then
      @next = ""
   end

   respond_to do |format|
      format.xml
    end

  end

end