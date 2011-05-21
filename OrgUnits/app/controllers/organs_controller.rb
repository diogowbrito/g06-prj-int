class OrgansController < ApplicationController

  def list
    @start = params[:start] || '1'
    @end = params[:end] || '5'
    @next = @end.to_i+1

    @organs = Organ.find(:all, :order => "organ_name", :offset => @start.to_i-1, :limit => @end.to_i+1-@start.to_i)

    respond_to :xml
  end

  def specific
    @organs = Organ.find(params[:id])
    @secretary = Secretary.where(:organ_id => @organs)
    respond_to :xml
  end

  # GET /organs
  # GET /organs.xml
  def index
    @organs = Organ.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @organs }
    end
  end

  # GET /organs/1
  # GET /organs/1.xml
  def show
    @organ = Organ.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @organ }
    end
  end

  # GET /organs/new
  # GET /organs/new.xml
  def new
    @organ = Organ.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @organ }
    end
  end

  # GET /organs/1/edit
  def edit
    @organ = Organ.find(params[:id])
  end

  # POST /organs
  # POST /organs.xml
  def create
    @organ = Organ.new(params[:organ])

    respond_to do |format|
      if @organ.save
        format.html { redirect_to(@organ, :notice => 'Organ was successfully created.') }
        format.xml  { render :xml => @organ, :status => :created, :location => @organ }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @organ.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /organs/1
  # PUT /organs/1.xml
  def update
    @organ = Organ.find(params[:id])

    respond_to do |format|
      if @organ.update_attributes(params[:organ])
        format.html { redirect_to(@organ, :notice => 'Organ was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @organ.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /organs/1
  # DELETE /organs/1.xml
  def destroy
    @organ = Organ.find(params[:id])
    @organ.destroy

    respond_to do |format|
      format.html { redirect_to(organs_url) }
      format.xml  { head :ok }
    end
  end
end
