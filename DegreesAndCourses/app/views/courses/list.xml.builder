xml.instruct!(:xml, :version=>"1.0")

xml.list(:title => "Courses", :start => @start, :end => @end) do
  @courses.each do |course|
    xml.item(course.name, :title => "Course", :href => "http://localhost:3002/courses/"+course.id.to_s)
  end
end