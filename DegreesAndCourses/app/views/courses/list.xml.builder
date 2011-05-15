xml.instruct!(:xml, :version=>"1.0")

xml.list(:title => "Courses", :start => @start, :end => @end) do
  @courses.each do |course|
    xml.item(course.name, :title => "Course", :href => course.id)
  end
end