xml.record(:title => "Cadeira") do
  xml.text(@course.name, :title => "name")
  xml.text(@course.period, :title => "period")
  xml.text(@course.sigla, :title => "sigla")
  xml.entity(@course.regent, :title => "Regente", :kind => "person")
end