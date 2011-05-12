xml.record(:title => "Curso") do
  xml.text(@degree.name, :title => "name")
  xml.text(@degree.sigla, :title => "sigla")
  xml.entity(@degree.department, :title => "Departamento")
  xml.text(@degree.type, :title => "Tipo")
end