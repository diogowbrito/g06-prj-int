xml.record(:title => "Cadeira") do
  xml.text(@course.name, :title => "Name")
  xml.text(@course.period, :title => "Period")
  xml.text(@course.sigla, :title => "Sigla")
  xml.entity(@course.regent, :title => "Regente", :kind => "person")
end