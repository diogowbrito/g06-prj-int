xml.record(:title => "Professor") do
  xml.text(@professor.professor_name, :title => "name")
  xml.text(:title => "Emails") do
    @emails.each do |email|
      xml.entity(email, :type => "email")
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
      xml.entity(course, :type => "course")
    end
  end
end