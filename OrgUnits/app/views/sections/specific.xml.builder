xml.record(:title => "Sections") do
  xml.text(@sections.section_name, :title => "Name")
  xml.text(@sections.schedule, :title => "Schedule")
  xml.text(:title => "Office Location") do
    xml.entity(@sections.building, :kind => "building")
    if @sections.space != nil then
      xml.entity(@sections.space, :kind => "room")
    end
  end
  if @sections.coordenator != nil then
    xml.text(@sections.coordenator, :title => "Coordenator")
  end
  xml.text(@sections.mail, :title => "Mail")
  xml.email(@sections.email)
  xml.text(@sections.telephone, :title => "Telephone")
  xml.text(@sections.extension, :title => "Extension")
  if @sections.fax != nil then
    xml.text(@sections.fax, :title => "Fax")
  end

end