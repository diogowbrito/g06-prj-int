xml.record(:title => "Curso") do
  xml.text(@degree.name, :title => "name")
  xml.text(:title => "Cadeiras") do
    @cadeiras.each do |course|
      xml.entity(course.email, :type => "email")
    end
  end
  xml.text(:title => "Office Location") do
  xml.entity(@professor.building, :type => "building")
  xml.entity(@professor.room, :type => "room")
  end
  xml.text(@professor.category, :title => "Category")
  xml.entity(@professor.sector, :title => "Sector", :type => "organizational unit")
  xml.text(:title => "Courses") do
    @courses.each do |course|
      xml.entity(course.course_name, :type => "course")
    end
  end
end