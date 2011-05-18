xml.record(:title => "Professor") do
  xml.text(@professor.professor_name, :title => "name")
  xml.text(:title => "Emails") do
    @emails.each do |email|
      xml.email(email.email)
    end
  end
  xml.text(:title => "Office Location") do
  xml.entity(@professor.building, :kind => "building")
  xml.entity(@professor.room, :kind => "room")
  end
  xml.text(@professor.category, :title => "Category")
  xml.entity(@professor.sector, :title => "Sector", :kind => "organizational unit")
  xml.text(:title => "Courses") do
    @courses.each do |course|
      xml.entity(course.course_name, :kind => "course")
    end
  end
end