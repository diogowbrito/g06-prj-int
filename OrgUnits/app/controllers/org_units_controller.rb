class OrgUnitsController < ApplicationController

  def meta_info
    respond_to :xml
  end

  def description
    respond_to :xml
  end

  def status
    respond_to :xml
  end

  def search
    @keyword = params[:keyword].gsub("%", "\%").gsub("_", "\_")
    @start = params[:start] || '1'
    @end = params[:end] || '20'
    @next = @end.to_i+1

    departments = Department.find(:all, :order=> "department_name", :conditions=> ["department_name like ?", "%"+@keyword+"%"])
    organs = Organ.find(:all, :order=> "organ_name", :conditions=> ["organ_name like ?", "%"+@keyword+"%"])
    services = Service.find(:all, :order=> "service_name", :conditions=> ["service_name like ?", "%"+@keyword+"%"])

    @list = []
    @list1 = []
    @list2 = []

    counter = 1

    departments.each do |dep|
      if counter >= @start.to_i && counter <= @end.to_i then
        @list << dep
      end
      counter = counter+1
    end

    organs.each do |org|
      if counter >= @start.to_i && counter <= @end.to_i then
        @list1 << org
      end
      counter = counter+1
    end

    services.each do |serv|
      if counter >= @start.to_i && counter <= @end.to_i then
        @list2 << serv
      end
      counter = counter+1
    end

    if @list.count+@list1.count+@list2.count != 20 then
      @next = ""
    end

    respond_to :xml
  end

  def recommendation
    @keyword = params[:keyword].gsub("%", "\%").gsub("_", "\_")
    @start = params[:start] || '1'
    @end = params[:end] || '10'
    @next = @end.to_i+1

    departments = Department.find(:all, :order=> "department_name", :conditions=> ["department_name like ?", "%"+@keyword+"%"])
    organs = Organ.find(:all, :order=> "organ_name", :conditions=> ["organ_name like ?", "%"+@keyword+"%"])
    services = Service.find(:all, :order=> "service_name", :conditions=> ["service_name like ?", "%"+@keyword+"%"])

    if @list.count+@list1.count+@list2.count != 20 then
      @next = ""
    end

    @list = []
    @list1 = []
    @list2 = []

    departments.each do |dep|
      @list << dep.department_name
    end

    organs.each do |org|
      @list1 << org.organ_name
    end

    services.each do |serv|
      @list2 << serv.service_name
    end

  end

end
