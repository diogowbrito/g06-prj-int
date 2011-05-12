xml.list(:title => @keyword) do
  @degrees.each do |degree|
    xml.item(degree.name, :title => "Degree", :href => degree.id)
  end
  @courses.each do |course|
    xml.item(course.name, :title => "Course", :href => course.id)
  end

    xml.start(@start)
    xml.end(@end)
end