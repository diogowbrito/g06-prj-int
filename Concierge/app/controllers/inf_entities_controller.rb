class InfEntitiesController < ApplicationController
  # GET /inf_entities
  # GET /inf_entities.xml
  def index
    @inf_entities = InfEntity.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @inf_entities }
    end
  end

  # GET /inf_entities/1
  # GET /inf_entities/1.xml
  def show
    @inf_entity = InfEntity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @inf_entity }
    end
  end

  # GET /inf_entities/new
  # GET /inf_entities/new.xml
  def new
    @inf_entity = InfEntity.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @inf_entity }
    end
  end

  # GET /inf_entities/1/edit
  def edit
    @inf_entity = InfEntity.find(params[:id])
  end

  # POST /inf_entities
  # POST /inf_entities.xml
  def create
    @inf_entity = InfEntity.new(params[:inf_entity])

    respond_to do |format|
      if @inf_entity.save
        format.html { redirect_to(@inf_entity, :notice => 'Inf entity was successfully created.') }
        format.xml  { render :xml => @inf_entity, :status => :created, :location => @inf_entity }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @inf_entity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /inf_entities/1
  # PUT /inf_entities/1.xml
  def update
    @inf_entity = InfEntity.find(params[:id])

    respond_to do |format|
      if @inf_entity.update_attributes(params[:inf_entity])
        format.html { redirect_to(@inf_entity, :notice => 'Inf entity was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @inf_entity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /inf_entities/1
  # DELETE /inf_entities/1.xml
  def destroy
    @inf_entity = InfEntity.find(params[:id])
    @inf_entity.destroy

    respond_to do |format|
      format.html { redirect_to(inf_entities_url) }
      format.xml  { head :ok }
    end
  end
end
