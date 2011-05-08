class RefEntitiesController < ApplicationController
  # GET /ref_entities
  # GET /ref_entities.xml
  def index
    @ref_entities = RefEntity.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ref_entities }
    end
  end

  # GET /ref_entities/1
  # GET /ref_entities/1.xml
  def show
    @ref_entity = RefEntity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ref_entity }
    end
  end

  # GET /ref_entities/new
  # GET /ref_entities/new.xml
  def new
    @ref_entity = RefEntity.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ref_entity }
    end
  end

  # GET /ref_entities/1/edit
  def edit
    @ref_entity = RefEntity.find(params[:id])
  end

  # POST /ref_entities
  # POST /ref_entities.xml
  def create
    @ref_entity = RefEntity.new(params[:ref_entity])

    respond_to do |format|
      if @ref_entity.save
        format.html { redirect_to(@ref_entity, :notice => 'Ref entity was successfully created.') }
        format.xml  { render :xml => @ref_entity, :status => :created, :location => @ref_entity }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ref_entity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ref_entities/1
  # PUT /ref_entities/1.xml
  def update
    @ref_entity = RefEntity.find(params[:id])

    respond_to do |format|
      if @ref_entity.update_attributes(params[:ref_entity])
        format.html { redirect_to(@ref_entity, :notice => 'Ref entity was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ref_entity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ref_entities/1
  # DELETE /ref_entities/1.xml
  def destroy
    @ref_entity = RefEntity.find(params[:id])
    @ref_entity.destroy

    respond_to do |format|
      format.html { redirect_to(ref_entities_url) }
      format.xml  { head :ok }
    end
  end
end
