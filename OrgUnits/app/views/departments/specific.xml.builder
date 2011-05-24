xml.record(:title => "Department") do
  xml.link(@department.department_name, :title => "Name", :ehref => @department.site)
  xml.text(@department.symbol, :title => "Symbol")
  xml.entity(@department.building, :kind => "building")
end
