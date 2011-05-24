xml.record(:title => "Department") do
  xml.text(@department.department_name, :title => "Name")
  xml.link(@department.site, :title => "Site", :ehref => @department.site)
  xml.text(@department.symbol, :title => "Symbol")
  xml.entity(@department.building, :kind => "building")
end
