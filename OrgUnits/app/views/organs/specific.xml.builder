xml.record(:title => "Organs") do
  xml.text(@organs.organ_name, :title => "Name")
  xml.text(:title => "Office Location") do
    xml.entity(@organs.building, :kind => "building")
    xml.entity(@organs.space, :kind => "room")
  end
  if @organs.president != nil then
    xml.text(@organs.president, :title => "President")
  else
    xml.text(@organs.subdirector, :title => "Subdirector")
  end
  xml.text(@organs.mail, :title => "Mail")
  xml.email(@organs.email, :title => "Email")
  xml.text(@organs.telephone, :title => "Telephone")
  if @organs.extension != nil then
    xml.text(@organs.extension, :title => "Extension")
  end
  xml.text(@organs.fax, :title => "Fax")
  xml.text(:title => "Secretariat") do
    @secretary.each do |ele|
      xml.text(:title => "Secretary") do
        xml.text(ele.secretary_name, :title => "Name")
        if ele.email != nil then
          xml.email(ele.email, :title => "Emails")
        end
      end
    end
  end

end