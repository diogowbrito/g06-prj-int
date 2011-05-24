class ProfessorsController < ApplicationController
  # GET /professors
  # GET /professors.xml

  def description
    respond_to :xml
  end

  def meta_info
    respond_to :xml
  end

  def status
    respond_to :xml
  end

  def list
    @start = params[:start] || '1'
    @end = params[:end] || '20'
    @next = @end.to_i+1

    @professors = Professor.find(:all, :order => "professor_name", :offset => @start.to_i-1, :limit => @end.to_i+1-@start.to_i)

    if @professors.count != 20 then
      @next = ""
    end

    respond_to :xml
  end

  def specific
    @professor = Professor.find(params[:id])
    @emails = @professor.emails
    @courses = @professor.courses

    respond_to :xml
  end

  def search

    @keyword =  params[:keyword].gsub("%", "\%").gsub("_", "\_")
    @start = params[:start] || '1'
    @end = params[:end] || '20'
    @next = @end.to_i+1
    keyarray = @keyword.to_s.split(' ')
    professors = Professor.find(:all, :conditions=> ["professor_name like ?","%"+@keyword+"%"])

    @list = []
    counter = 1
    professors.each do |p|

      if counter >= @start.to_i then
           @list << p
      end

      counter = counter.to_i+1

      if counter > @end.to_i then
        break
      end

    end

    if @list.count != 20 then
      @next = ""
    end

    respond_to :xml
  end

  def recommendation

    @keyword = params[:keyword].gsub("%", "\%").gsub("_", "\_")
    @start = params[:start] || '1'
    @end = params[:end] || '10'
    @next = @end.to_i+1
    professors = Professor.find(:all, :conditions=> ["professor_name like ?", @keyword + "%"], :offset => @start.to_i-1, :limit => @end.to_i+1-@start.to_i)

    if professors.count != 10 then
      @next = ""
    end

    @list = []
    professors.each do |professor|
      @list << professor.professor_name
    end

    respond_to :xml
  end

  def index
    @professors = Professor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @professors }
    end
  end

  # GET /professors/1
  # GET /professors/1.xml
  def show
    @professor = Professor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @professor }
    end
  end

  # GET /professors/new
  # GET /professors/new.xml
  def new
    @professor = Professor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @professor }
    end
  end

  # GET /professors/1/edit
  def edit
    @professor = Professor.find(params[:id])
  end

  # POST /professors
  # POST /professors.xml
  def create
    @professor = Professor.new(params[:professor])

    respond_to do |format|
      if @professor.save
        format.html { redirect_to(@professor, :notice => 'Professor was successfully created.') }
        format.xml  { render :xml => @professor, :status => :created, :location => @professor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @professor.errors, :status => :unprocessable_entity }
      end
    end
  end


  # PUT /professors/1
  # PUT /professors/1.xml
  def update
    @professor = Professor.find(params[:id])

    respond_to do |format|
      if @professor.update_attributes(params[:professor])
        format.html { redirect_to(@professor, :notice => 'Professor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @professor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /professors/1
  # DELETE /professors/1.xml
  def destroy
    @professor = Professor.find(params[:id])
    @professor.destroy

    respond_to do |format|
      format.html { redirect_to(professors_url) }
      format.xml  { head :ok }
    end
  end
end
