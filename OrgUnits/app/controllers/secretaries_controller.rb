class SecretariesController < ApplicationController
  # GET /secretaries
  # GET /secretaries.xml
  def index
    @secretaries = Secretary.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @secretaries }
    end
  end

  # GET /secretaries/1
  # GET /secretaries/1.xml
  def show
    @secretary = Secretary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @secretary }
    end
  end

  # GET /secretaries/new
  # GET /secretaries/new.xml
  def new
    @secretary = Secretary.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @secretary }
    end
  end

  # GET /secretaries/1/edit
  def edit
    @secretary = Secretary.find(params[:id])
  end

  # POST /secretaries
  # POST /secretaries.xml
  def create
    @secretary = Secretary.new(params[:secretary])

    respond_to do |format|
      if @secretary.save
        format.html { redirect_to(@secretary, :notice => 'Secretary was successfully created.') }
        format.xml  { render :xml => @secretary, :status => :created, :location => @secretary }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @secretary.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /secretaries/1
  # PUT /secretaries/1.xml
  def update
    @secretary = Secretary.find(params[:id])

    respond_to do |format|
      if @secretary.update_attributes(params[:secretary])
        format.html { redirect_to(@secretary, :notice => 'Secretary was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @secretary.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /secretaries/1
  # DELETE /secretaries/1.xml
  def destroy
    @secretary = Secretary.find(params[:id])
    @secretary.destroy

    respond_to do |format|
      format.html { redirect_to(secretaries_url) }
      format.xml  { head :ok }
    end
  end
end
