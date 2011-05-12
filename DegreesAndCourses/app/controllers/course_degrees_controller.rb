class CourseDegreesController < ApplicationController
  # GET /course_degrees
  # GET /course_degrees.xml
  def index
    @course_degrees = CourseDegree.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @course_degrees }
    end
  end

  # GET /course_degrees/1
  # GET /course_degrees/1.xml
  def show
    @course_degree = CourseDegree.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @course_degree }
    end
  end

  # GET /course_degrees/new
  # GET /course_degrees/new.xml
  def new
    @course_degree = CourseDegree.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @course_degree }
    end
  end

  # GET /course_degrees/1/edit
  def edit
    @course_degree = CourseDegree.find(params[:id])
  end

  # POST /course_degrees
  # POST /course_degrees.xml
  def create
    @course_degree = CourseDegree.new(params[:course_degree])

    respond_to do |format|
      if @course_degree.save
        format.html { redirect_to(@course_degree, :notice => 'Course degree was successfully created.') }
        format.xml  { render :xml => @course_degree, :status => :created, :location => @course_degree }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @course_degree.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /course_degrees/1
  # PUT /course_degrees/1.xml
  def update
    @course_degree = CourseDegree.find(params[:id])

    respond_to do |format|
      if @course_degree.update_attributes(params[:course_degree])
        format.html { redirect_to(@course_degree, :notice => 'Course degree was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @course_degree.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /course_degrees/1
  # DELETE /course_degrees/1.xml
  def destroy
    @course_degree = CourseDegree.find(params[:id])
    @course_degree.destroy

    respond_to do |format|
      format.html { redirect_to(course_degrees_url) }
      format.xml  { head :ok }
    end
  end
end
