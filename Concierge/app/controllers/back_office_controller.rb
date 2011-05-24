class BackOfficeController < ApplicationController

  def newservice

    respond_to :html

  end

  def createservice

    @url = params[:url]
    @doc = Nokogiri::XML(open(@url), nil, 'UTF-8')
    @name = @doc.root['name']
    url =  @doc.root['url']
    provider = @doc.at_css("provider").text()
    type = @doc.at_css("type").text()
    tags = @doc.xpath("//tag")
    stags = []

    tags.each do |tag|
      stags << tag.text()
    end

    search = @doc.at_css("search").text()
    refentities = @doc.at_css("referedEntities").children()
    refent = []

    refentities.each do |entity|
      refent << entity.text()
    end

    infentities = @doc.at_css("informedEntities").children()
    infent = []

    infentities.each do |entity|
      infent << entity.text()
    end

    competences = @doc.xpath("//competence")
    comp = []

    competences.each do |competence|
      acomp = []
      acomp << competence['path']
      acomp << competence.at_css("description").text()
      acomp << competence.at_css("ctype").text()
      comp << acomp
    end

    Service.create :serviceName => @name, :provider => provider, :servicetype => type, :ranking => 0, :url => url, :imgPath => 'TODO'
    service = Service.where(:serviceName => @name)
    id = service[0].id
    serviceurl = service[0].url

    stags.each do |tag|
      Tag.create :service_id => id, :tag => tag
    end

    refent.each do |ent|
      RefEntity.create :entity => ent, :service_id => id
    end

    infent.each do |ent|
      InfEntity.create :entity => ent, :service_id => id
    end

    comp.each do |c|
      Competence.create :competenceType => c[2], :competenceUrl => serviceurl+c[0], :description => c[1], :service_id => id
    end

    respond_to :html

  end

  def listservices

    @services = Service.all
    @competences = Competence.all

    respond_to :html

  end

  def destroyservice

    @id = params[:id]

    @service = Service.find(@id)
    @service.destroy

    @competences = Competence.where(:service_id => @id)
    @competences.each do |competence|
      competence.destroy
    end

    @refent = RefEntity.where(:service_id => @id)
    @refent.each do |ent|
      ent.destroy
    end

    @infent = InfEntity.where(:service_id => @id)
    @infent.each do |ent|
      ent.destroy
    end

    @tags = Tag.where(:service_id => @id)
    @tags.each do |tag|
      tag.destroy
    end

    respond_to do |format|
      format.html { redirect_to(:action => 'listservices') }
    end

  end

end
