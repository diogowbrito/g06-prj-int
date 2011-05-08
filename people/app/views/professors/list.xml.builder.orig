xml.list(:title => "Professors List", :start => @start, :end => @end ) do
  @professors.each do |professor|
    xml.item(professor.professor_name, :title => "Professor", :href => professor.id)
  end
end