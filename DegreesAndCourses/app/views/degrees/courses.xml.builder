xml.record(:title => "Curso") do

  xml.text(@degree.name, :title => "name")
  xml.text(@degree.id, :title => "id")
  xml.text(@degree.degree_id, :title => "degree_id")

  xml.record(:title => "Cadeiras")  do
  @courses.each do |course|

  xml.text(course.name, :title =>"name")
      end
   end
end