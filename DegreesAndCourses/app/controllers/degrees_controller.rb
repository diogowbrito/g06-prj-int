class DegreesController < ApplicationController
  # GET /degrees
  # GET /degrees.xml
  def index
    @degrees = Degree.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @degrees }
    end
  end

  # GET /degrees/1
  # GET /degrees/1.xml
  def show
    @degree = Degree.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @degree }
    end
  end


  def list
    @start = params[:start] || '1'
    @end = params[:end] || '20'

    @degrees = Degree.find(:all, :order => "name", :offset => @start.to_i-1, :limit => @end.to_i+1-@start.to_i)

    respond_to do |format|
      format.xml
    end
  end

  def specific

    @degreeId = params[:id]
    @degree = Degree.find(@degreeId)

    course_degrees = CourseDegree.find_all_by_degree_id(@degree.degree_id)

    @courses = []
    course_degrees.each do |c_d|

      course = Course.find_by_course_id(c_d.course_id)
      if !@courses.include?(course)
        @courses.push(course)
        end
    end

    respond_to do |format|
      format.xml
    end
  end


  # GET /degrees/new
  # GET /degrees/new.xml
  def new
    @degree = Degree.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @degree }
    end
  end

  # GET /degrees/1/edit
  def edit
    @degree = Degree.find(params[:id])
  end

  # POST /degrees
  # POST /degrees.xml
  def create
    @degree = Degree.new(params[:degree])

    respond_to do |format|
      if @degree.save
        format.html { redirect_to(@degree, :notice => 'Degree was successfully created.') }
        format.xml { render :xml => @degree, :status => :created, :location => @degree }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @degree.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /degrees/1
  # PUT /degrees/1.xml
  def update
    @degree = Degree.find(params[:id])

    respond_to do |format|
      if @degree.update_attributes(params[:degree])
        format.html { redirect_to(@degree, :notice => 'Degree was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @degree.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /degrees/1
  # DELETE /degrees/1.xml
  def destroy
    @degree = Degree.find(params[:id])
    @degree.destroy

    respond_to do |format|
      format.html { redirect_to(degrees_url) }
      format.xml { head :ok }
    end
  end

end
